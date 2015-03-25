$ = require 'jquery'

module.exports =
class Selection

  @getSelectedContents: =>
    selection = window.getSelection()
    len = selection.rangeCount
    $contents = $()
    for i in [0...len] by 1
      range = selection.getRangeAt i
      $contents = $contents.add @walk selection, range.commonAncestorContainer
    $contents

  @walk: (selection, container) =>
    $container = $ container
    $contents = $()
    return $contents.add $container if selection.containsNode container
    $container.contents().each (i, content) =>
      $contents = $contents.add @walk selection, content
    $contents
