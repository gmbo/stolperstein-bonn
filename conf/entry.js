import { createG4UInternal } from 'node_modules/guide4you/src/main'

import defaultClientConf from 'guide4you-builder/mustache-eval-loader?name=conf/[name].[ext]!./client.commented.json'
import defaultLayerConf from 'guide4you-builder/mustache-eval-loader?name=conf/[name].[ext]!./layers.commented.json'

import 'guide4you-builder/tojson-file-loader?name=files/[name]!node_modules/guide4you/files/l10n.json.js'
import 'file?name=lib/[name].[ext]!src/tabswitcher.js'
import 'file?name=lib/[name].[ext]!css/tabs.css'

window.createG4U = function (target, clientConf = defaultClientConf, layerConf = defaultLayerConf) {
  return createG4UInternal(target, clientConf, layerConf)
}

export default window.createG4U
