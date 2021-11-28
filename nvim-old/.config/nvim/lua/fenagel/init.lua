local function init()
  require 'fenagel.vim'.init()
  require 'fenagel.packer'.init()
end

return {
  init = init,
}
