# vim: set ft=ruby

guard :shell do
  watch(%r{^(app|src|spec|web)}) { `ctags -f tags app src spec web` }
  watch(%r{^(app|src|spec|web)}) { `find app src spec web vendor -name '*.php' > cscope.files && cscope -b` }
  watch('composer.lock') { `ctags -f vendor.tags vendor` }
end
