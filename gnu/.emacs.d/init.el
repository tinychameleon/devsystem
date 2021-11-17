;;; init.el --- Emacs Initialization -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Stephan Tarulli
;;
;; Author: Stephan Tarulli
;; Keywords: init
;; Version: 0.1
;;
;; GPLv3 Licensed. See LICENSE file for full legal text.

;;; Commentary:
;;
;; Handles the initialization process for all defined sub-packages and ensures
;; any necessary fundamental configuration options are set up prior to
;; initialization completing.
;;
;; All user-specific functionality should use the prefix "tc/".

;;; Code:

(defconst tc/local-package-path
  (concat user-emacs-directory "site-lisp")
  "The path where private local packages are stored.")


;; Set up the package load paths.

(when (not (file-directory-p tc/local-package-path))
  (mkdir tc/local-package-path))

(add-to-list 'load-path tc/local-package-path)


;; Ensure customize writes to the correct location and that customized values
;; are loaded.

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))


;; Load all configuration in the correct order.

(require 'tc-packaging)


;;; init.el ends here
