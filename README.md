# `find-key-binding`

Find where a key binding is set, for example, `M-x find-key-binding C-s` will bring you to the following place in `isearch.el`

    (define-key global-map "\C-s" 'isearch-forward)
