# vim: ft=ruby

guard :shell do
  watch /^(src|spec|features|tests)/ do
    `ctags -f tags src spec features tests`
    `find src spec features tests -type f -name '*.php' > cscope.files`
    `cscope -b`
  end

  watch /^composer/ do
    `ctags -f vendor.tags vendor`
    `find vendor -type f -name '*.php' > cscope.vendor.files`
    `cscope -b -i cscope.vendor.files -f cscope.vendor.out`
  end
end
