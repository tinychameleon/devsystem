;;; tc-packaging.el --- Package.el Configuration & Initialization -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Stephan Tarulli
;;
;; Author: Stephan Tarulli
;; Keywords: init, package.el
;; Version: 0.1
;;
;; GPLv3 Licensed. See LICENSE file for full legal text.

;;; Commentary:
;;
;; Ensures that package.el is configured correctly and initializes the
;; use-package package for all other package interactions.

;;; Code:

(require 'package)

(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-head" . "https://melpa.org/packages/") t)

(setq package-archive-priorities '(("gnu" . 1) ("melpa-stable" . 2))
      package-enable-at-startup nil)

(package-initialize)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(provide 'tc-packaging)

;;; tc-packaging.el ends here
