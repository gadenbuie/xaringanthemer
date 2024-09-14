;(function () {
  function findPkgdownGlobalRoot () {
    const origin = window.location.origin
    const path = window.location.pathname.replace(/[^/]+$/, '')

    // Special cases supported by our versioned pkgdown workflow
    const specials = [/dev\//, /preview\//, /v\d+\.\d+\.\d+\//]
    for (const special of specials) {
      if (special.test(path)) {
        return origin + path.split(special)[0]
      }
    }

    const pkgdownDirs = ['articles', 'news', 'reference']
    for (const pkgdownDir of pkgdownDirs) {
      if (path.includes(pkgdownDir)) {
        return origin + path.split(`${pkgdownDir}/`)[0]
      }
    }

    return origin + path
  }

  function pathDir (url) {
    return url.replace(/\/[^/]+$/, '/')
  }

  function ensureTrailingSlash (url) {
    return /\/$/.test(url) ? url : url + '/'
  }

  function ensureFullPath (url) {
    return /^\//.test(url) ? window.location.origin + url : url
  }

  function findPkgdownLocalRoot () {
    // get `src` attribute of the current <script> tag
    const scripts = document.getElementsByTagName('script')
    const currentScript = scripts[scripts.length - 1]

    let src = pathDir(currentScript.getAttribute('src'))
    if (!src.includes('/') || src === '/') {
      src = ''
    }

    const currentDir = pathDir(window.location.href)
    const root = new URL(currentDir + src).toString()
    return ensureTrailingSlash(root)
  }

  function makeNewPkgdownLink (newBase) {
    newBase = ensureFullPath(newBase)
    newBase = ensureTrailingSlash(newBase)
    return window.location.href.replace(findPkgdownLocalRoot(), newBase)
  }

  async function getVersions () {
    let versionsUrl
    if (window.PKGDOWN_VERSIONS_URL) {
      versionsUrl = window.PKGDOWN_VERSIONS_URL
    } else {
      let pkgdownRoot = findPkgdownGlobalRoot()
      if (!/\/$/.test(pkgdownRoot)) {
        pkgdownRoot += '/'
      }
      versionsUrl = pkgdownRoot + 'doc-versions.json'
    }

    try {
      const response = await fetch(versionsUrl)
      return response.json()
    } catch {
      return null
    }
  }

  function createVersionDropdown (current, versions) {
    if (typeof versions === 'string') {
      console.error(
        '`doc-versions.json` should be an array or object, not a string'
      )
      return
    }

    const dropdown = document.createElement('ul')
    dropdown.classList.add('navbar-nav')

    const li = document.createElement('li')
    li.classList.add('nav-item', 'dropdown')
    dropdown.appendChild(li)

    const a = document.createElement('a')
    a.classList.add('nav-link', 'dropdown-toggle')
    if (current.matches('.text-danger')) {
      a.classList.add('text-danger')
    }
    a.href = '#'
    a.role = 'button'
    a.dataset.bsToggle = 'dropdown'
    a.ariaExpanded = false
    a.innerText = current.innerText
    li.appendChild(a)

    const ul = document.createElement('ul')
    ul.classList.add('dropdown-menu')
    li.appendChild(ul)

    if (versions.constructor === Object) {
      versions = [versions]
    }

    versions.forEach(item => {
      if (item === '---') {
        ul.appendChild(createVersionDropdownDivider())
        return
      }

      // if item is a string, it is a header
      if (typeof item === 'string') {
        ul.appendChild(createVersionDropdownHeader(item))
        return
      }

      const version = item.version ? item.version : item.text.replace(/^v/, '')
      const isCurrent = current.innerText === version
      ul.appendChild(createVersionDropdownItem(item, isCurrent))
    })

    return dropdown
  }

  function createVersionDropdownItem ({ text, url }, isCurrent = false) {
    const li = document.createElement('li')
    const a = document.createElement('a')
    a.classList.add('dropdown-item')
    if (isCurrent) a.classList.add('active')

    // link to current page in the other version (may not exist!)
    a.href = makeNewPkgdownLink(url)
    a.innerText = text

    li.appendChild(a)
    return li
  }

  function createVersionDropdownDivider () {
    // <li><hr class="dropdown-divider"></li>
    const li = document.createElement('li')
    const hr = document.createElement('hr')
    hr.classList.add('dropdown-divider')
    li.appendChild(hr)

    return li
  }

  function createVersionDropdownHeader (text) {
    // <li><h6 class="dropdown-header">Dropdown header</h6></li>
    const li = document.createElement('li')
    const h6 = document.createElement('h6')
    h6.classList.add('dropdown-header')
    h6.innerText = text
    li.appendChild(h6)

    return li
  }

  function insertBanner (banner) {
    if (!banner) return
    const main = document.querySelector('main')
    if (!main) return

    let { html, class: classes } = banner
    if (typeof classes === 'string') {
      // Classes can be a string or an array of strings
      classes = [classes]
    }

    // <div class="d-block px-3 py-2 text-center text-bold skippy">
    // <a href="https://getbootstrap.com/" class="text-white text-decoration-none">There's a newer version of Bootstrap!</a>
    // </div>
    const div = document.createElement('div')
    div.classList.add('alert', 'px-3', 'py-2', 'text-center', ...classes)
    div.innerHTML = html
    div.querySelectorAll('a').forEach(a => {
      if (!a.hasAttribute('href')) {
        a.href = makeNewPkgdownLink(findPkgdownGlobalRoot())
      }
    })

    main.insertAdjacentElement('afterbegin', div)
    return div
  }

  function maybeInsertBanner (versions) {
    if (!versions) return
    if (!Array.isArray(versions)) return

    // keep versions entries that are objects with a `banner` property
    versions = versions.filter(item => item && item.banner)

    const localRoot = findPkgdownLocalRoot()

    for (const version of versions) {
      const versionUrl = ensureFullPath(version.url)
      if (localRoot === versionUrl) {
        return insertBanner(version.banner)
      }
    }
  }

  async function replaceVersionWithMenu () {
    const current = document.querySelector('.navbar .navbar-brand + small')
    if (!current) return

    const versions = await getVersions()
    if (!versions) return

    const dropdown = createVersionDropdown(current, versions)
    current.replaceWith(dropdown)
    maybeInsertBanner(versions)
  }

  replaceVersionWithMenu()
})()
