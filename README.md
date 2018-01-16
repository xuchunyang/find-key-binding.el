# `find-key-binding` [![Build Status](https://travis-ci.org/xuchunyang/find-key-binding.el.svg?branch=master)](https://travis-ci.org/xuchunyang/find-key-binding.el)

Find where a key binding is set, for example, `M-x find-key-binding C-s` will bring you to the following place in `isearch.el`

    (define-key global-map "\C-s" 'isearch-forward)
