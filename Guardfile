# vim: set ft=ruby

guard :shell do
  watch(%r{^(app/config|src|spec|web)}) {
    `killall ctags`
    `find app/config src spec web -type f -name '*.php' -o -name '*.css' -o -name '*.js' -o -name '*.twig' -o -name '*.yml' -o -name '*.xml' | ctags -f tags -L -`
  }
  watch(%r{^(app/config|src|spec|web)}) {
    `killall cscope`
    `find app/config src spec web vendor -type f -name '*.php' -o -name '*.twig' -o -name '*.yml' -o -name '*.xml' > cscope.files && cscope -b`
  }
  watch('composer.lock') {
    `ctags -f vendor.tags vendor`
  }
end
