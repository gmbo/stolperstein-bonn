'use strict'

let path = require('path')
let baseDir = process.cwd()
const HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports = {
  entry: {
    'lib/g4u.js': [ path.join(baseDir, './conf/entry.js') ]
  },
  output: {
    path: path.join(baseDir, './build')
  },
  resolve: {
    alias: {
      'lessConfig.less': path.join(baseDir, './conf/clouds.less')
    }
  },
  mustacheEvalLoader: {
    templateVars: {
      pageTitle: '',
      ajaxProxy: 'proxy/proxy.php?csurl={url}',
      languageFile: 'files/l10n.json',
      svgColor: 'rgba(255,255,255,1)',
      proxyAjaxFilters: 'true',
      proxyFilterDomain: 'false',
      proxyAjaxDebug: 'false',
      proxyValidRequests: [
	"http://stadtplan.bonn.de/geojson",
	"https://www.mediawiki.org/w/api.php"
      ]
    }
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: 'html/client.html',
      favicon: 'images/stolperstein.png',
      title: 'Stolpersteine für NS-Opfer in Bonn und Umgebung',
      inject: 'head'
    })
  ]
}
