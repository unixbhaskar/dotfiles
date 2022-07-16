
;; Author: Bhaskar Chowdhury

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(add-log-mailing-address "unixbhaskar@gmail.com")
 '(all-the-icons-dired-monochrome nil)
 '(all-the-icons-ivy-rich-mode t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(calendar-mark-diary-entries-flag t)
 '(calendar-mark-holidays-flag t)
 '(calendar-view-diary-initially-flag t)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compose-mail-user-agent-warnings nil)
 '(corfu-global-mode t)
 '(cua-enable-modeline-indications t)
 '(custom-enabled-themes '(molokai))
 '(custom-safe-themes
   '("3e200d49451ec4b8baa068c989e7fba2a97646091fd555eca0ee5a1386d56077" "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "b494aae329f000b68aa16737ca1de482e239d44da9486e8d45800fd6fd636780" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "6daa09c8c2c68de3ff1b83694115231faa7e650fdbb668bc76275f0f2ce2a437" "fede08d0f23fc0612a8354e0cf800c9ecae47ec8f32c5f29da841fe090dfc450" "8f567db503a0d27202804f2ee51b4cd409eab5c4374f57640317b8fcbbd3e466" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" default))
 '(debug-on-error t)
 '(deft-filter-only-filenames t)
 '(diary-file "~/.emacs.d/OrgFiles/diary.org")
 '(dired-use-ls-dired t)
 '(display-line-numbers-type 'relative)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-use-mail-icon t)
 '(doom-modeline-bar-width 2)
 '(doom-modeline-env-elixir-executable "iex")
 '(doom-modeline-env-go-executable "go")
 '(doom-modeline-env-perl-executable "perl")
 '(doom-modeline-env-python-executable "python")
 '(doom-modeline-env-ruby-executable "ruby")
 '(doom-modeline-env-rust-executable "rustc")
 '(doom-modeline-github t)
 '(doom-modeline-gnus t)
 '(doom-modeline-height 10)
 '(doom-modeline-icon t)
 '(doom-modeline-indent-info t)
 '(doom-modeline-mode t)
 '(doom-modeline-mu4e t)
 '(doom-modeline-window-width-limit 80)
 '(elfeed-feeds
   '("https://blog.tecosaur.com/tmio/rss.xml" "https://www.reddit.com/r/orgmode.rss" "https://www.reddit.com/r/emacs.rss" "http://pragmaticemacs.com/feed/" "https://planet.emacslife.com/atom.xml" "https://updates.orgmode.org/feed/changes" "http://oremacs.com/atom.xml" "https://oneofus.la/have-emacs-will-hack/feed.xml" "http://www.sysadminblogs.com/planet/atom.xml" "http://feeds2.feedburner.com/webupd8" "http://aws.typepad.com/aws/atom.xml" "http://www.openstack.org/blog/feed/" "http://selinuxnews.org/wp/index.php/feed/" "http://www.learninglinux.com/backend.php" "http://opensource.org/blog/feed" "http://z.about.com/6/g/linux/b/rss2.xml" "http://linuxtoday.com/backend/biglt.rss" "http://www.debian-administration.org/articles.rdf" "http://feeds.feedburner.com/Insidehpc" "http://lxer.com/module/newswire/headlines.rss" "http://feeds.delicious.com/rss/OracleTechnologyNetwork/linux" "http://rss.techtarget.com/184.xml" "http://z.about.com/6/o/m/linux_p2.xml" "http://linux-foundation.org/weblogs/press/feed/" "http://www.linux-mag.com/cache/rss20.xml" "http://google-opensource.blogspot.com/atom.xml" "http://wiki.openvz.org/w/index.php?title=Special:RecentChanges&feed=rss" "http://feeds2.feedburner.com/oreilly/linux" "http://www.linuxinsider.com/perl/syndication/rssfull.pl" "http://kernelnewbies.org/RecentChanges?action=rss_rc&ddiffs=1&unique=1" "http://dev.mysql.com/mysql.rss" "http://feeds2.feedburner.com/Command-line-fu" "http://kbase.redhat.com/faq/community/feeds/documents?community=2001" "http://www.linux.com/feature?theme=rss" "http://feeds.feedburner.com/Go2linux" "http://linuxvirtualization.com/xml/rss/feed.xml" "http://feeds.feedburner.com/unixmenhowtos" "http://linux.ittoolbox.com/rss/12/white_papers" "http://www.sun.com/bigadmin/content/rss/scripts.xml" "http://esr.ibiblio.org/?feed=rss2" "http://www.kroah.com/log/index.rss" "http://www.hackitlinux.com/index.rss" "http://feeds.oreilly.com/oreilly/lamp" "http://www.unix.com/external.php?type=RSS2" "http://feeds.feedburner.com/Phoronix" "http://www.linuxhpc.org/backend/linuxhpc.rdf" "http://www.pixelbeat.org/feed/rss2.xml" "http://blog.ivanristic.com/atom.xml" "http://www.novell.com/news/novell-in-the-news/RSS" "http://penguinista.org/feed" "http://kernel.org/kdist/rss.xml" "http://www.linuxtopia.org/linuxtopia.rss" "http://administratosphere.wordpress.com/feed/" "http://snipt.net/public/tag/bash/feed" "http://feeds.feedburner.com/susegeek" "http://superuser.com/feeds/tag/linux" "http://kerneloops.org/rss.php" "http://unixbhaskar.wordpress.com/feed/" "http://www.reddit.com/r/linux/.rss" "http://rss.techtarget.com/421.xml" "http://feeds.feedburner.com/linuxweblog" "http://feeds.feedburner.com/HowToLinux" "http://www.blogger.com/feeds/09134601055128665246/blogs" "http://packages.gentoo.org/feed/newpackage" "http://www.ducea.com/feed/" "http://feeds.feedburner.com/linuxscrew" "http://feeds.feedburner.com/Shell-fu" "http://feeds.askapache.com/apache/htaccess" "http://linux.byexamples.com/feed/" "http://www.linuxformat.co.uk/backend.php" "http://feeds.oreilly.com/oreilly/sysadmin" "http://feeds.linuxinsight.com/linuxportal" "http://rss.slashdot.org/Slashdot/slashdotApache" "http://unixbhaskar.blogspot.com/feeds/posts/default" "http://www.linuxsecurity.com/static-content/linuxsecurity_advisories.rss" "http://tuxtraining.com/feed" "http://www.reviewlinux.com/rss/rss_howtos.xml" "http://www.ibm.com/developerworks/views/linux/rss/libraryview.jsp" "http://planet.nagios.org/archives?format=feed&type=rss" "http://www.linuxhomenetworking.com/wiki/index.php?title=Special:RecentChanges&feed=rss" "http://feeds.feedburner.com/Unixtutorials" "http://jakarta.apache.org/site/rss.xml" "http://feeds.cyberciti.biz/Nixcraft-LinuxFreebsdSolarisTipsTricks" "http://www.clustermonkey.net/component/option,com_rss/feed,RSS2.0/no_html,1/" "http://www.fsf.org/news/RSS" "http://nagios.org/backend/feeds/frontpage/" "http://rss.slashdot.org/Slashdot/slashdotLinux" "http://feeds.feedburner.com/UbuntuGeek" "http://www.sitepoint.com/feed.rdf/all/tech/" "http://www.linuxhaxor.net/feed/" "http://mysqlha.blogspot.com/feeds/posts/default" "http://feeds.feedburner.com/MozillaLinks" "http://systhread.net/rss.xml" "http://feeds.feedburner.com/linuxtutorial" "http://www.oreillynet.com/pub/feed/9" "http://www.linuxquestions.org/syndicate/lqlatest.xml" "http://services.devx.com/outgoing/devxfeed.xml" "http://www.linuxfromscratch.org/lfs/feed.rss" "http://mongrel.rubyforge.org/rss.xml" "http://aspiringsysadmin.com/blog/feed/" "http://www.linuxplus.net/feed/" "http://www.linuxworld.com/rss/linux-news.xml" "http://mysqldba.blogspot.com/atom.xml" "http://www.howtoforge.com/node/feed" "http://www.linuxjournal.com/node/feed" "http://lwn.net/headlines/newrss" "http://www.linuxexpert.com/feed/" "http://kerneltrap.org/node/feed" "http://www.monitoringexchange.org/cgi-bin/search.cgi?query=_SPECIAL&special=newplugins&xml_feed=1&xml_title=MonitoringExchange%20-%20New%20Plugins;d=1" "http://www.lids.org/?q=rss.xml" "http://feeds.feedburner.com/TheGeekStuff" "http://lkml.org/rss.php" "http://www.fridu.org/faqs-aamp-tips-mainmenu-80/40-hosting-a-sysadmin?format=feed&type=rss" "http://serverfault.com/feeds/tag/linux" "http://digg.com/rss/indexlinux_unix.xml" "http://www.usinglinux.org/rss.php" "http://www.tuxwire.com/category/Howto/feed/" "http://www.itworld.com/blogs/81/feed" "https://www.kernel.org/feeds/all.atom.xml" "http://software.intel.com/en-us/blogs/feed" "http://blogs.oracle.com/MySQL/feed/entries/rss?cat=/MySQL" "http://www.linuxfoundation.org/news-media/news/rss.xml" "http://www.osnews.com/files/recent.xml" "http://www.mysqlperformanceblog.com/feed/" "http://feeds.howtogeek.com/howtogeek" "http://rootprompt.org/rss/" "http://feeds.feedburner.com/TechCrunch/" "http://www.linuxinsight.com/aggregator/rss" "http://linuxinstruction.com/?q=rss.xml" "http://feeds.feedburner.com/Reviewlinux" "http://linuxsysadminblog.com/atom.xml" "http://static.fsf.org/fsforg/rss/news.xml" "http://www.eweek.com/servers/rss/" "http://oops.kernel.org/feed/" "http://www.nagios.org/backend/feeds/frontpage/" "http://www.nagios.org/backend/feeds/community/" "http://www.nagios.org/news?format=feed&type=rss" "http://www.nagios.org/backend/feeds/uber/" "http://www.linux-on-laptops.com/rss.xml" "http://www.shell-tips.com/feed/" "http://www.tuxradar.com/rss" "http://www.tuxmachines.org/node/feed" "http://feeds.feedburner.com/linuxfaq?format=xml" "http://devops.com/feed/" "http://0pointer.de/blog/index.rss2" "http://coreos.com/atom.xml" "http://java.awsblog.com/blog/feed/recentPosts.rss" "http://www.archlinux.org/feeds/news/" "http://blog.mariadb.org/feed/" "http://www.planetmysql.org/rss20.xml"))
 '(emojify-emoji-styles '(ascii github unicode))
 '(eww-browse-url-new-window-is-tab t)
 '(exwm-floating-border-color "#1e1e3f")
 '(frame-background-mode 'dark)
 '(gdb-many-windows t)
 '(git-commit-setup-hook
   '(git-commit-save-message git-commit-setup-changelog-support git-commit-turn-on-auto-fill git-commit-turn-on-flyspell git-commit-propertize-diff bug-reference-mode with-editor-usage-message))
 '(git-messenger:show-detail t)
 '(git-messenger:use-magit-popup t)
 '(global-emojify-mode t)
 '(global-emojify-mode-line-mode t)
 '(global-highlight-changes-mode t)
 '(global-highlight-parentheses-mode t)
 '(global-prettify-symbols-mode t)
 '(gnus-add-timestamp-to-message t)
 '(gnus-default-nntp-server "news.gnus.org")
 '(gnus-expert-user t)
 '(grep-highlight-matches 'always)
 '(icomplete-mode t)
 '(image-dired-dir "~/Pictures")
 '(image-dired-main-image-directory "~/Pictures")
 '(ispell-highlight-face 'flyspell-incorrect)
 '(ivy-posframe-mode t nil (ivy-posframe))
 '(ivy-posframe-style 'frame-center)
 '(ivy-rich-mode t)
 '(jdee-db-active-breakpoint-face-colors (cons "#161a2a" "#82aaff"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#161a2a" "#3ad900"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#161a2a" "#444a73"))
 '(magit-repository-directories
   '(("~/projects/AdminScripts" . 5)
     ("~/dotfiles" . 0)
     ("~/Collected_Notes" . 0)
     ("~/LaTeX_Workouts" . 0)
     ("~/projects/emacs" . 0)
     ("~/projects/linux-next" . 0)
     ("~/projects/vim" . 0)
     ("~/projects/linux" . 0)
     ("~/git-linux/gcc" . 0)
     ("~/git-linux/git" . 0)
     ("~/git-linux/i3" . 0)
     ("~/git-linux/nyxt" . 0)))
 '(marginalia-mode t)
 '(mml-secure-openpgp-sign-with-sender t)
 '(mu4e-display-update-status-in-modeline t)
 '(mu4e-icalendar-diary-file "~/.emacs.d/OrgFiles/refile.org")
 '(mu4e-mu-binary "/usr/local/bin/mu")
 '(nnir-notmuch-remove-prefix "/home/bhaskar/gmail-backup")
 '(notmuch-always-prompt-for-sender t)
 '(notmuch-maildir-use-notmuch-insert t)
 '(notmuch-show-all-tags-list t)
 '(notmuch-tag-added-formats '((".*" (notmuch-apply-face tag 'nil))))
 '(objed-cursor-color "#ff000d")
 '(org-agenda-diary-file "~/.emacs.d/OrgFiles/diary.org")
 '(org-agenda-files
   '("/home/bhaskar/.emacs.d/OrgFiles/diary.org" "/home/bhaskar/.emacs.d/OrgFiles/task.org"))
 '(org-agenda-include-diary t)
 '(org-agenda-insert-diary-extract-time t)
 '(org-directory "~/.emacs.d/OrgFiles")
 '(org-export-backends '(ascii html icalendar latex md odt org texinfo))
 '(org-file-apps
   '((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . "vimb %s")
     ("\\.pdf\\'" . "zathura %s")))
 '(org-roam-completion-everywhere t)
 '(org-roam-dailies-directory "~/.emacs.d/OrgFiles/daily/")
 '(org-roam-mode t nil (org-roam))
 '(org-roam-server-mode t)
 '(org-startup-with-inline-images t)
 '(org-tag-beautify-mode t)
 '(org-todo-keywords
   '((sequence "TODO(t)" "DONE(d)" "STARTED(s)" "WAITING(w)" "ONGOING(o)" "CANCELLED(c)" "NEXT(n)" "HOLD(h)" "MEETING(m)" "PHONE(p)")))
 '(package-archive-upload-base "/home/bhaskar/.emacs.d/elpa/archives/gnu elpa")
 '(package-selected-packages
   '(org-gcal ix cl-libify pocket-reader scratch modus-themes sudo-edit mark-multiple xclip orgit org2web amx grip-mode dired-toggle flyspell-correct-popup flycheck-grammarly org-ref-prettify ivy-bibtex annotation annotate dashboard-project-status spell-fu helpful ctags-update org-beautify-theme org-tag-beautify org-timeline org-dashboard org wgrep org-roam org-noter git-timemachine multiple-cursors browse-at-remote w3m consult-company embark-consult highlight-parentheses keytar move-text dired-git-info smart-compile vimrc-mode vertico selectrum-prescient orderless crux dired-git keychain-environment with-emacs dired-icon magit-topgit magit-popup git-commit-insert-issue pinentry org-pomodoro insert-shebang chronos magit-org-todos spinner lsp-grammarly counsel-notmuch rainbow-delimiters rainbow-mode org-protocol-jekyll org-roam-server org-download goto-line-preview smex undo-tree slime imenus dictionary org-books all-the-icons-ibuffer weather-metno swiper-helm emacs-everywhere pretty-symbols emojify esup restart-emacs org-capture-pop-frame smart-mode-line-powerline-theme remember-last-theme wttrin all-the-icons-ivy-rich mode-icons sml-mode magithub toc-org org-bullets all-the-icons-ivy pdf-view-restore popup-edit-menu popup-kill-ring popup-switcher popup-complete popup-imenu git-messenger all-the-icons-dired all-the-icons engine-mode use-package synosaurus pass page-break-lines mu4e-alert molokai-theme ffmpeg-player elfeed-goodies define-word command-log-mode auto-complete))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(pdf-view-use-imagemagick t)
 '(pdf-view-use-unicode-ligther t)
 '(popper-reference-buffers '("\\*Messages\\*$"))
 '(rustic-ansi-faces
   ["#2d2b55" "#ff000d" "#3ad900" "#fad000" "#82aaff" "#ff9d00" "#ff628c" "#e3e9fa"])
 '(safe-local-variable-values
   '((eval add-hook 'after-save-hook
           (lambda nil
             (org-babel-tangle))
           nil t)))
 '(scroll-bar-mode nil)
 '(send-mail-function 'mailclient-send-it)
 '(smtpmail-debug-info t)
 '(smtpmail-default-smtp-server "smtp.gmail.com")
 '(smtpmail-local-domain "gmail.com")
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(smtpmail-smtp-user "unixbhaskar")
 '(smtpmail-stream-type 'starttls)
 '(user-mail-address "unixbhaskar@gmail.com")
 '(warning-suppress-types '((browse-url)))
 '(webjump-sites
   '(("GNU Project FTP Archive" .
      [mirrors "https://ftp.gnu.org/pub/gnu/" "https://ftpmirror.gnu.org"])
     ("GNU Project Home Page" . "www.gnu.org")
     ("Emacs Home Page" . "www.gnu.org/software/emacs/emacs.html")
     ("Savannah Emacs page" . "savannah.gnu.org/projects/emacs")
     ("Emacs Lisp List" . "www.damtp.cam.ac.uk/user/eglen/emacs/ell.html")
     ("Emacs Wiki" .
      [simple-query "www.emacswiki.org" "www.emacswiki.org/cgi-bin/wiki/" ""])
     ("DuckDuckGo" .
      [simple-query "duckduckgo.com" "duckduckgo.com/?q=" ""])
     ("Google" .
      [simple-query "www.google.com" "www.google.com/search?q=" ""])
     ("Google Groups" .
      [simple-query "groups.google.com" "groups.google.com/groups?q=" ""])
     ("Yahoo" .
      [simple-query "www.yahoo.com" "search.yahoo.com/search?p=" ""])
     ("Yahoo: Reference" . "www.yahoo.com/Reference/")
     ("Wikipedia" .
      [simple-query "wikipedia.org" "wikipedia.org/wiki/" ""])
     ("National Weather Service" . webjump-to-iwin)
     ("Usenet FAQs" . "www.faqs.org/faqs/")
     ("RTFM Usenet FAQs by Group" . "ftp://rtfm.mit.edu/pub/usenet-by-group/")
     ("RTFM Usenet FAQs by Hierarchy" . "ftp://rtfm.mit.edu/pub/usenet-by-hierarchy/")
     ("X Consortium Archive" . "ftp.x.org")
     ("Association for Computing Machinery" . "www.acm.org")
     ("Computer Professionals for Social Responsibility" . "www.cpsr.org")
     ("Electronic Frontier Foundation" . "www.eff.org")
     ("IEEE Computer Society" . "www.computer.org")
     ("Risks Digest" . webjump-to-risks)
     ("Supplemental Web site list for webjump" . "www.neilvandyke.org/webjump/")
     (" My Blog At Wordpress " . "unixbhaskar.wordpress.com")
     ("Linux Kernel " . "https://kernel.org/"))))
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
;; Package repos
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
			 ("org" . "https://orgmode.org/elpa/")))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("gnu elpa" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
             '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)



(let ((default-directory "~/.emacs.d/elpa"))
  (normal-top-level-add-subdirs-to-load-path))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
(package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
(use-package command-log-mode)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;;Mu4e setup
(setq load-path (append load-path '("~/.emacs.d/mu/mu4e")))
(require 'mu4e)

(setq user-full-name "Bhaskar Chowdhury"
      user-mail-address "unixbhaskar@gmail.com")
(setq mu4e-get-mail-command "getmail"
      mu4e-update-interval 300
      mu4e-attachment-dir "~/attachments")

(setq mu4e-mu-binary "/usr/local/bin/mu")
;; Encryption
(require 'mml2015)
(require 'epa-file)

(defun encrypt-message (&optional arg)
  (interactive "p")
  (mml-secure-message-encrypt-pgp))

(defun decrypt-message (&optional arg)
  (interactive "p")
  (epa-decrypt-armor-in-region (point-min) (point-max)))

(defalias 'ec 'encrypt-message)
(defalias 'dc 'decrypt-message)
;;External browser invoke
(setq browse-url-browser-function 'browse-url-vimb)
;; Line number and Column number
(column-number-mode)

(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		mu4e-main-mode-hook
		mu4e-view-mode-hook
		mu4e-compose-mode-hook
		mu4e-headers-mode-hook
		mu4e-org-mode-hook
		eshell-mode-hook
		eww-buffers-mode-hook
                markdown-mode-hook
                vterm-mode-hook))
(add-hook mode (lambda () (display-line-numbers-mode 0))))

(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
;; Mu4e various customization
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;(require 'org-mu4e)
(require 'mu4e-contrib)
(require 'smtpmail)
(auth-source-pass-enable)
(setq auth-source-debug t)
(setq auth-source-do-cache nil)
(setq auth-sources '(password-store))
(setq message-kill-buffer-on-exit t)
(setq message-send-mail-function 'smtpmail-send-it)
(setq mu4e-attachment-dir "~/attachments")
(setq mu4e-compose-complete-addresses t)
(setq mu4e-compose-context-policy nil)
(setq mu4e-context-policy 'pick-first)
(setq mu4e-view-show-addresses t)
(setq mu4e-view-show-images t)
(setq smtpmail-debug-info t)
(setq smtpmail-stream-type 'starttls)
(setq mm-sign-option 'guided)

(when (fboundp 'imagemagick-register-types)
    (imagemagick-register-types))

(defun sign-or-encrypt-message ()
    (let ((answer (read-from-minibuffer "Sign or encrypt?\nEmpty to do nothing.\n[s/e]: ")))
      (cond
       ((string-equal answer "s") (progn
                                    (message "Signing message.")
                                    (mml-secure-message-sign-pgpmime)))
       ((string-equal answer "e") (progn
                                    (message "Encrypt and signing message.")
                                    (mml-secure-message-encrypt-pgpmime)))
       (t (progn
            (message "Dont signing or encrypting message.")
            nil)))))

  (add-hook 'message-send-hook 'sign-or-encrypt-message)



(use-package mu4e
     :ensure nil
     :config

     (setq mu4e-change-filenames-when-moving t)
     (setq mu4e-update-interval (* 10 60))
     (setq mu4e-getmail-command "getmail")
     (setq mu4e-maildir "~/gmail-backup")
     (setq mu4e-sent-folder "/sent")

     (setq mu4e-maildir-shortcuts
       '( (:maildir "/Inbox"              :key ?i)
       (:maildir "/Greg(GKH)"             :key ?g)
       (:maildir "/Linus"                 :key ?l)
       (:maildir "/Andrew_Morton"         :key ?a)
       (:maildir "/Al_Viro"               :key ?v)
       (:maildir "/Jonathan_Corbet"       :key ?j)
       (:maildir "/Paul_E_McKenney"       :key ?p)
       (:maildir "/Thomas_Gleixner"       :key ?t)
       (:maildir "/linux-kernel"          :key ?k)
       (:maildir "/David_Miller"          :key ?d))))
;; Disable uppercase
(put 'upcase-region 'disabled nil)
;;open vimb,invoke it like browse-url-generic on M-x prompt
(setq browse-url-generic-program
    (executable-find (getenv "BROWSER"))
     browse-url-browser-function 'browse-url-generic)
;; Change META key to window key
(setq x-super-keysym 'meta)
;; Which-key,a key pop up for key binds
(use-package which-key
    :init (which-key-mode)
    :diminish which-key-mode
    :config
    (setq which-key-idle-delay 0.3))
;; Ivy-rich
(use-package ivy-rich
	     :init
	     (ivy-rich-mode 1))
;; Mu4e Alerts
;; (use-package mu4e-alert
;;     :after mu4e
;;     :hook ((after-init . mu4e-alert-enable-mode-line-display)
;;            (after-init . mu4e-alert-enable-notifications))
;;     :config (mu4e-alert-set-default-style 'libnotify))
;; Visual line mode and Flyspell mode
(add-hook 'mu4e-view-mode-hook #'visual-line-mode)
(add-hook 'mu4e-compose-mode-hook 'flyspell-mode)
;;(setq mu4e-compose-in-new-frame t)
(setq mu4e-compose-format-flowed t)
;; Mute system's gpg to use emacs own
(setq epg-gpg-program "gpg2")
(setenv "GPG_AGENT_INFO" nil)
;; Pass a password manager
(use-package pass
  :pin melpa
  :config
  (setf epa-pinentry-mode 'loopback))
;;vterm

(use-package vterm
	         :ensure t)
(add-to-list 'load-path "~/.emacs.d/emacs-libvterm/")
(require 'vterm)

(global-set-key (kbd "C-x t") 'vterm)
;; Secret file for password store
(setq auth-source-debug t)

(setq auth-sources
          '((:source "~/.emacs.d/secrets/.authinfo.gpg")))
;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)
;;elfeed

(global-set-key (kbd "C-x n e") 'elfeed)
;;Auto Complete

;;(global-auto-complete-mode t)

;; dirty fix for having AC everywhere
(require 'auto-complete)
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)


;;Color settings

;;(set-foreground-color "white")
;;(set-background-color "blue")
;; make {copy, cut, paste, undo} have {C-c, C-x, C-v, C-z} keys
;; (cua-mode 1)


;; New Window. was nil
(progn
(global-set-key (kbd "C-S-n") 'make-frame-command)
)

;; UTF-8 as default encoding
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


;;Refiling folders

;;(setq mu4e-refile-folder
  ;;(lambda (msg)
    ;;(cond
      ;; messages from Linus go to the /Linus folder
      ;;((mu4e-message-contact-field-matches msg :from
	;; "torvalds@linux-foundation.org")
	;;"/Linus")
      ;;((mu4e-message-contact-field-matches msg :from
	;; "viro@zeniv.linux.org.uk")
	;;"/Al_Viro")
      ;;((mu4e-message-contact-field-matches msg :from
	;; "gregkh@linuxfoundation.org")
	;;"/Greg(GKH)")
      ;;((mu4e-message-contact-field-matches msg :from
	;; "akpm@linux-foundation.org")
	;;"/Andrew_Morton")
      ;;((mu4e-message-contact-field-matches msg :from
	;; "corbet@lwn.net")
	;;"/Jonathan_Corbet")
      ;;((mu4e-message-contact-field-matches msg :from
	;; "paulmck@kernel.org")
	;;"/Paul_E_Mckenney")
      ;; messages sent directly to me go to /archive
      ;; also `mu4e-user-mail-address-p' can be used
      ;;((mu4e-message-contact-field-matches msg :to "me@example.com")
	;;"/private")
      ;; messages with football or soccer in the subject go to /football
      ;;((string-match "football\\|soccer"
	;; (mu4e-message-field msg :subject))
	;;"/football")
      ;; messages sent by me go to the sent folder
      ;;((find-if
	;; (lambda (addr)
	  ;; (mu4e-message-contact-field-matches msg :from addr))
	 ;;(mu4e-personal-addresses))
	;;mu4e-sent-folder)
      ;; everything else goes to /archive
      ;; important to have a catch-all at the end!
      ;;(t  "/archive")
;;)))
;; Gnus

(setq user-mail-address "unixbhaskar@gmail.com"
      user-full-name "Bhaskar Chowdhury")
(setq gnus-select-method '(nntp "news.eternal-september.org"))
(setq gnus-secondary-select-methods
      '((nntp "news.gwene.org")
      (nnimap "gmail"
	       (nnimap-address "imap.gmail.com")  ; it could also be imap.googlemail.com if that's your server.
	       (nnimap-server-port "imaps")
	       (nnimap-stream ssl))))

(setq smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
;; Spell-check
(require 'flyspell)
(setq flyspell-issue-message-flag nil
      ispell-local-dictionary "en_US"
      ispell-program-name "aspell"
      ispell-extra-args '("--sug-mode=ultra"))

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
;; Never use tabs - always spaces
(setq-default indent-tabs-mode nil)
;; Remove trailing whitespace on each save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Autocompletion: Company mode is better thought out than auto-complete.
(use-package company
  :defer 2
  :config
  (global-company-mode 1))

(global-set-key "\t" 'company-complete-common)
 ;; (add-to-list 'company-backends 'company-dabbrev-code)
 ;; (add-to-list 'company-backends 'company-files)
 ;; (add-to-list 'company-backends 'company-keywords)


;; SPELL CHECKING
;; Spell checking requires an external command to be available. Install =aspell= on your Mac, then make it the default checker for Emacs' =ispell=. Note that personal dictionary is located at =~/.aspell.LANG.pws= by default.

(setq ispell-program-name "aspell")

;; Enable spellcheck on the fly for all text modes. This includes org, latex and LaTeX. Spellcheck current word.

(add-hook 'text-mode-hook 'flyspell-mode)
(global-set-key (kbd "M-\\") 'ispell-word)
(global-set-key (kbd "C-M-\\") 'flyspell-auto-correct-word)
;; THESAURUS

;; Spellcheck was =Cmd+\=, synonym search is =Cmd+Shift+\=. It requires =wordnet= to be installed locally.
;; (use-package powerthesaurus
;;   :config
;;   (global-set-key (kbd "s-|") 'powerthesaurus-lookup-word-dwim)
;;   )

;; Alternative, local thesaurus
(use-package synosaurus
  :config
  (global-set-key (kbd "M-|") 'synosaurus-choose-and-replace))
;; Word definition search.
(use-package define-word
  :config
  (global-set-key (kbd "M-\\") 'define-word-at-point))
;;Org mode stuff
(define-key mu4e-headers-mode-map (kbd "C-c c") 'org-mu4e-store-and-capture)
;;Emms Music player

(require 'emms-setup)
(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "~/Music/")
(require 'emms-player-simple)
(require 'emms-source-file)
(require 'emms-source-playlist)
(setq emms-player-list '(emms-player-mpg321
                         emms-player-ogg123
                         emms-player-mpv
                         emms-player-mplayer))

(setq emms-info-asynchronously nil)
(setq emms-playlist-buffer-name "*Music*")
;;Mpv integration

(load "emms-player-mpv.el")

(global-set-key (kbd "C-x m") 'emms)
(global-set-key (kbd "C-c s p") 'emms-pause)
(global-set-key (kbd "C-c s n") 'emms-next)
(global-set-key (kbd "C-c s s") 'emms-stop)
(global-set-key (kbd "C-c s m") 'emms-mark-all)
(global-set-key (kbd "C-c s a") 'emms-add-file)
(global-set-key (kbd "C-c s f") 'emms-add-dired)
(global-set-key (kbd "C-c s t") 'emms-toggle-repeat-track)
(global-set-key (kbd "C-c s r") 'emms-previous)

(defun track-title-from-file-name (file)
  "For using with EMMS description functions. Extracts the track
title from the file name FILE, which just means a) taking only
the file component at the end of the path, and b) removing any
file extension."
  (with-temp-buffer
    (save-excursion (insert (file-name-nondirectory (directory-file-name file))))
    (ignore-error 'search-failed
      (search-forward-regexp (rx "." (+ alnum) eol))
      (delete-region (match-beginning 0) (match-end 0)))
    (buffer-string)))

(defun my-emms-track-description (track)
  "Return a description of TRACK, for EMMS, but try to cut just
the track name from the file name, and just use the file name too
rather than the whole path."
  (let ((artist (emms-track-get track 'info-artist))
        (title (emms-track-get track 'info-title)))
    (cond ((and artist title)
           (concat artist " - " title))
          (title title)
          ((eq (emms-track-type track) 'file)
           (track-title-from-file-name (emms-track-name track)))
          (t (emms-track-simple-description track)))))

(setq emms-track-description-function 'my-emms-track-description)


;;Org mode files

(setq org-agenda-files
      '("~/.emacs.d/OrgFiles/task.org"))
;; Maximize a specific pane

(defun x11-maximize-frame ()
  "Maximize the current frame (to full screen)"
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))

(global-set-key (kbd "C-f") 'x11-maximize-frame)
;; Ivy posframe for spawn window on middle of the screen

(use-package ivy-posframe
	     :ensure  t
             :delight
	     :custom
              (ivy-posframe-height-alist
		'((swipper . 15)
		  (t . 10)))
	     (ivy-posframe-display-fucntion-alist
	       '((comple-symbol . ivy-posframe-display-at-point)
		 (counsel-describe-function . nil)
		 (counsel-describe-variable . nil)
		 (swipper . nil)
		 (swipper-isearch . nil)
		 (t . ivy-posframe-display-at-frame-center)))
	     :config
	     (ivy-posframe-mode 1))
;; Open calendar

(global-set-key (kbd "C-x c") 'calendar)
;; Show time on mode line

 (display-time-mode 1)
;; Display battery percentage
;; (display-battery-mode 1)
;; Indentation specific stuff

(add-hook 'sh-mode-hook
	       (lambda ()
		 (setq sh-basic-offset 2)))

(add-hook 'c-mode-hook
	       (lambda ()
		 (c-set-style "linux")
		 (setq c-basic-offset 8
		       c-block-comment-prefix "* ")
		 (c-set-offset 'arglist-intro '++)
		 (c-set-offset 'arglist-cont '++)
		 (c-set-offset 'arglist-cont-nonempty '++)
		 (setq indent-tabs-mode t)))

(add-hook 'lisp-mode-hook
	       (lambda ()
		 (setq indent-tabs-mode nil)))

(add-hook 'awk-mode-hook
	       (lambda ()
		 (c-set-style "awk")))
;; Highlight current line

(when window-system (global-hl-line-mode))
;; Better grep

(setq grep-command "grep --color -nH -e")
;; Follow symlinks

(setq vc-follow-symlinks t)
;; Compilation mode

(use-package compile
  :demand t)
;; Engine mode

 (use-package engine-mode
    :config
     (engine/set-keymap-prefix (kbd "C-c s"))

     (defengine duckduckgo
	"https://duckduckgo.com/?q=%s"
	:keybinding "d")

     (defengine github
	"https://github.com/search?ref=simplesearch&q=%s"
	:keybinding "g")

     (defengine wikipedia
	"https://en.wikipedia.org/wiki/%s"
	:keybinding "w")


     ;; (defengine youtube
	;; "https://www.youtube.com/results?aq=f&oq=&search_query=%s"
	;; :keybinding "y")


     (engine-mode t))
;; Setup Markdown

(use-package markdown-mode
  :mode (("README\\.md\\'" . gfm-mode)
	     ("\\.md\\'" . markdown-mode)
	     ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc"))
;; All the icons

(use-package all-the-icons)

(use-package all-the-icons-dired
   :hook (dired-mode . all-the-icons-dired-mode))
;; Text scale increase and decrease

(define-key global-map (kbd "C-1") 'text-scale-increase)
(define-key global-map (kbd "C-0") 'text-scale-decrease)
;; Use magit-show-commit for showing status/diff commands

(global-set-key (kbd "C-x v p") 'git-messenger:popup-message)
;;(define-key git-messenger-map (kbd "m") 'git-messenger:copy-message)


;; Customization of org mode

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

;; Add TAG to the org file

(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l) ("Reading" . ?r) ("Researching" . ?s) ("Medical" . ?m) ("Technical" . ?t)))


;; Powerline modline

(use-package smart-mode-line-powerline-theme
   :ensure t
   :after powerline
   :after smart-mode-line
   :config
    (sml/setup)
    (sml/apply-theme 'powerline)
)
(require 'powerline)
(powerline-default-theme)


;; Org babel to load languages
(org-babel-do-load-languages 'org-babel-load-languages
    '(
        (shell . t)
    )
)
;; Org buffer link back and forth key bind

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "M-n") 'org-next-link)
  (define-key org-mode-map (kbd "M-p") 'org-previous-link))
;; Use RETURN key to open the link in stead C-c C-o

(setq org-return-follows-link t)
;; Source code block comment

(set-register ?p "#+BEGIN_SRC perl\n\n#+END_SRC")
(set-register ?b "#+BEGIN_SRC bash\n\n#+END_SRC")
(set-register ?s "#+BEGIN_SRC sh\n\n#+END_SRC")
(set-register ?c "#+BEGIN_SRC C\n\n#+END_SRC")
(set-register ?l "#+BEGIN_SRC emacs-lisp\n\n#+END_SRC")
;; Make sure org-bullet-mode is ture
(setq org-bullets-mode t)
(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :config
  (setq org-bullets-bullet-list '("◉" "⁑" "⁂" "❖" "✮" "✱" "✸")))

;; Org-crypt

(use-package org-crypt
  :ensure nil  ;; included with org-mode
  :after org
  :config
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  :custom
  (setq org-crypt-key "9F017E9D"))
;; Startup time measure

  (add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))
;; Emojis

(use-package emojify
  :hook (after-init . global-emojify-mode))
;; Notmuch

(autoload 'notmuch "notmuch" "notmuch mail" t)
;; This for swithing to org file
(global-set-key "\C-cb" 'org-switchb)
;; This is for org capture
(global-set-key "\C-cc" 'org-capture)
;; Color TODO keywords

(defun org-capture-pdf-active-region ()
  "Capture the active region of the pdf-view buffer."
  (let* ((pdf-buf-name (plist-get org-capture-plist :original-buffer))
         (pdf-buf (get-buffer pdf-buf-name)))
    (if (buffer-live-p pdf-buf)
        (with-current-buffer pdf-buf
          (car (pdf-view-active-region-text)))
      (user-error "Buffer %S not alive." pdf-buf-name))))

;; Org capture template color distinguisher
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("ONGOING" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("STARTED" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "red" :weight bold)
              ("HOLD" :foreground "white" :weight bold)
              ("NEXT" :foreground "purple" :weight bold)
              ("MEETING" :foreground "yellow" :weight bold)
              ("PHONE" :foreground "cyan" :weight bold))))
;; Org mode tags triggers

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              ("DONE" ("DONE"  . t) )
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD")))))
              ;;("DONE" ("WAITING") ("CANCELLED") ("HOLD"))
;; Setting the org note file path

(setq org-default-notes-file "~/.emacs.d/OrgFiles/notes.org")
;; Templates for the org capture
(require 'org-protocol)

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote (("t" "Todo" entry (file "~/.emacs.d/OrgFiles/task.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("r" "Respond" entry (file "~/.emacs.d/OrgFiles/refile.org")
               "* Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "Note" entry (file "~/.emacs.d/OrgFiles/notes.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "~/.emacs.d/OrgFiles/journal.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("d" "Diary" entry (file+datetree "~/.emacs.d/OrgFiles/diary.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("R" "Refile" entry (file+olp+datetree "~/.emacs.d/OrgFiles/refile.org")
               "* TODO Review %A %^G\n%x\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/.emacs.d/OrgFiles/refile.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ;; ("p" "Phone call" entry (file "~/.emacs.d/OrgFiles/refile.org")
              ;;  "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("p" "PDF-Notes" entry (file "~/.emacs.d/OrgFiles/notes.org")
                  "* %?\n%(org-capture-pdf-active-region)\n")
              ("b" "Book" entry (file  "~/.emacs.d/OrgFiles/books.org")
	      ;; "* %^{TITLE}\n:PROPERTIES:\n:ADDED: %<[%Y-%02m-%02d]>\n:END:%^{AUTHOR}p\n%?" :empty-lines 1)
               "*  %(let* ((url (substring-no-properties (current-kill 0)))
                  (details (org-books-get-details url)))
                (when details (apply #'org-books-format 1 details)))")
;;("l" "Book log" item (function org-books-visit-book-log)
;;"- %U %?" :prepend t))))
             ("a" "Appointment" entry (file+olp+datetree "~/.emacs.d/OrgFiles/diary.org")
               "* APPT %^{Description} %^g %?\n Added: %U")
              ("c" "Contacts" entry (file+headline "~/.emacs.d/OrgFiles/contacts.org" "")
               "* %^{Name} :CONTACT: %[~/.emacs.d/OrgFiles/contacts.txt]"))))
;; Show the targets
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
;; Create new parent while refiling if it is not existed

(setq org-refile-allow-creating-parent-nodes 'confirm)
; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)
;; Mailto link open in compose mail
(setq org-link-mailto-program (quote (compose-mail "%a" "%s")))
(require 'org-mime)
;; Source code block syntax highliting

(setq org-src-fontify-natively t)
;; Preserving souce block indentation

(setq org-src-preserve-indentation nil)
(setq org-edit-src-content-indentation 0)
;; utf-8 is default encoding system

(setq org-export-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-charset-priority 'unicode)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
;; Notmuch shortcut

(global-set-key (kbd "M-n") 'notmuch)
;; Mu4e shortcut

(global-set-key (kbd "M-m") 'mu4e)
;; Make appt aware of appointments from the agenda

(defun org-agenda-to-appt ()
  "Activate appointments found in `org-agenda-files'."
  (interactive)
  (require 'org)
  (let* ((today (org-date-to-gregorian
		 (time-to-days (current-time))))
	 (files org-agenda-files) entries file)
    (while (setq file (pop files))
      (setq entries (append entries (org-agenda-get-day-entries
				     file today :timestamp))))
    (setq entries (delq nil entries))
    (mapc (lambda(x)
	    (let* ((event (org-trim (get-text-property 1 'txt x)))
		   (time-of-day (get-text-property 1 'time-of-day x)) tod)
	      (when time-of-day
		(setq tod (number-to-string time-of-day)
		      tod (when (string-match
				  "\\([0-9]\\{1,2\\}\\)\\([0-9]\\{2\\}\\)" tod)
			     (concat (match-string 1 tod) ":"
				     (match-string 2 tod))))
		(if tod (appt-add tod event))))) entries)))

;;(org-agenda-to-appt)
;; org mode appt reminder alert

(setq
  appt-message-warning-time 15 ;; warn 15 min in advance

  appt-display-mode-line t     ;; show in the modeline
  appt-display-format 'window) ;; use our func
(appt-activate 1)              ;; active appt (appointment notification)
(display-time)                 ;; time display is required for this...

 ;; update appt each time agenda opened

(add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt)
;; Start the server if it is not already STARTED

(load "server")
(unless (server-running-p) (server-start))
;; Few shortcut key for convenience date and time insertion

(defun mp-insert-date ()
  (interactive)
  (insert (format-time-string "%x")))

(defun mp-insert-time ()
  (interactive)
  (insert (format-time-string "%X")))

(global-set-key (kbd "C-c i d") 'mp-insert-date)
(global-set-key (kbd "C-c i t") 'mp-insert-time)
;; Set items ido mode vertically

(setq ido-separator "\n")
;; Pop up for buffer change

(global-set-key (kbd "C-b") 'counsel-switch-buffer)

(global-set-key (kbd "C-x p") 'counsel-M-x)
;; Blog related stuff

;; set the directory
(setq blog-mode-base-dir "/home/bhaskar/blogs/content/articles")
(require 'transient)

(defun blog-mode-file-peek (pattern file)
  (let ((result (car (process-lines "awk" "-F: " (concat pattern " {print $2}") file))))
    (if result
        (replace-regexp-in-string "\"" "" result)
      "")))

(defun blog-mode-parse-org (file)
  (let ((title (blog-mode-file-peek "/\\+title/" file))
        (date (blog-mode-file-peek "/\\+date/" file))
    ;;    (draft (blog-mode-file-peek "/\\+draft/" file))
        (tags (blog-mode-file-peek "/\\+tags/" file)))

    (list file (vector title date  tags))))

(defun blog-mode-parse-md (file)
  (let ((title (blog-mode-file-peek "/^title/" file))
        (date (blog-mode-file-peek "/^date/" file))
  ;;      (draft (blog-mode-file-peek "/^draft/" file))
        (tags (blog-mode-file-peek "/^tags/" file)))
    (list file (vector title  date  tags))))

(defun blog-mode-parse-directory (directory)
  (let ((md (concat directory "/index.md"))
        (org (concat directory "/index.org")))
    (if (file-exists-p md)
      (blog-mode-parse-md md)
      (if (file-exists-p org)
        (blog-mode-parse-org org)
        nil))))

(defun blog-mode-parse (file)
  (if (file-directory-p file)
      (blog-mode-parse-directory file)
    (let ((ex (file-name-extension file)))
      (if (string= ex "md")
          (blog-mode-parse-md file)
        (if (string= ex "org")
            (blog-mode-parse-org file)
          (message (concat "Unknown extension " ex)))))))

(defun blog-mode-refresh-data ()
  (setq blog-mode-entries nil)
  (dolist (file (process-lines "find" blog-mode-base-dir  "-maxdepth" "2" "-print"))
    (let ((entry (blog-mode-parse file)))
      (if entry
          (push (blog-mode-parse file) blog-mode-entries)))))

(define-derived-mode blog-mode tabulated-list-mode "blog-mode" "Major mode Blog Mode, to edit hugo blogs"
  (setq tabulated-list-format [("Title" 60 t)
                             ;;  ("Draft" 5 nil)
                               ("Date"  11 t)
			       ("Tags" 5 t)])
  (setq tabulated-list-padding 2)
  (setq tabulated-list-sort-key (cons "Date" t))
  (use-local-map blog-mode-map)
  (tabulated-list-init-header))

(defun blog-list ()
  (interactive)
  (pop-to-buffer "*Blog Mode*" nil)
  (blog-mode)
  (blog-mode-refresh-data)
  (setq tabulated-list-entries (-non-nil blog-mode-entries))
  (tabulated-list-print t))

(defvar blog-mode-map nil "keymap for blog-mode")

(setq blog-mode-map (make-sparse-keymap))

(define-key blog-mode-map (kbd "?") 'blog-mode-help)
(define-key blog-mode-map (kbd "o") 'blog-mode-open)
(define-key blog-mode-map (kbd "<return>") 'blog-mode-open)
;;(define-key blog-mode-map (kbd "d") 'blog-mode-drafts)
(define-key blog-mode-map (kbd "a") 'blog-mode-all)
(define-key blog-mode-map (kbd "p") 'blog-mode-published)
(define-key blog-mode-map (kbd "r") 'blog-mode-refresh-all)
(define-key blog-mode-map (kbd "c") 'blog-mode-make-draft)
;;(define-key blog-mode-map (kbd "s") 'blog-mode-start-hugo)
(define-key blog-mode-map (kbd "RET") 'blog-mode-open)

(transient-define-prefix blog-mode-help ()
  "Help transient for blog mode."
  ["Blog mode help"
   ("o" "Open" blog-mode-open)
  ;; ("d" "Drafts" blog-mode-drafts)
   ("a" "All" blog-mode-all)
   ("p" "Published" blog-mode-published)
   ("r" "Refresh" blog-mode-refresh-all)
   ("c" "Create post" blog-mode-make-draft)
;; ("s" "Start hugo" blog-mode-start-hugo)
   ])

(defun blog-mode-open ()
  (interactive)
  (find-file (tabulated-list-get-id)))

(defun blog-mode-refresh-all ()
  (interactive)
  (progn
    (blog-mode-refresh-data)
    (setq tabulated-list-entries (-non-nil blog-mode-entries))
    (tabulated-list-print t)))

(defun blog-mode-all ()
  (interactive)
  (progn
    (setq tabulated-list-entries (-non-nil blog-mode-entries))
    (tabulated-list-print t)))

;; (defun blog-mode-drafts ()
;;   (interactive)
;;   (progn
;;     (setq tabulated-list-entries
;;           (-filter (lambda (x)
;;                      (string= "true"
;;                               (aref (car (cdr x)) 1))) (-non-nil blog-mode-entries)))
;;     (tabulated-list-print t)))

(defun blog-mode-published ()
  (interactive)
  (progn
    (setq tabulated-list-entries
          (-filter (lambda (x)
                     (string= ""
                              (aref (car (cdr x)) 1))) blog-mode-entries)))
    (tabulated-list-print t))

(defun string-title-to-filename (str)
  "FooBar => foo_bar"
  (let ((case-fold-search nil))
    (setq str (replace-regexp-in-string "\\([a-z0-9]\\)\\([A-Z]\\)" "\\1_\\2" str))
    (setq str (replace-regexp-in-string "\\([A-Z]+\\)\\([A-Z][a-z]\\)" "\\1_\\2" str))
    (setq str (replace-regexp-in-string "-" "_" str)) ; FOO-BAR => FOO_BAR
    (setq str (replace-regexp-in-string "_+" "_" str))
    (setq str (replace-regexp-in-string " " "_" str))
    (downcase str)))

(defun blog-mode-make-draft ()
  "Little function to create a org file inside of the blog"
  (interactive)
  (let* (
         (mini (yes-or-no-p "Mini post? "))
         (title (read-from-minibuffer "Title: "))
         (tag (read-from-minibuffer "Tags: "))
         (year (format-time-string "%Y"))
         (filename (string-title-to-filename title))
         (rootpath (concat blog-mode-base-dir "/" year "/" filename))
         (path (if mini (concat rootpath ".org") (concat rootpath "/index.org")))
         )
    (set-buffer (find-file path))
    (insert "#+title: " title "\n")
    (insert "#+date: " (format-time-string "%Y-%m-%d") "\n")
    ;;(insert "#+draft: true\n")
    (insert "#+tags: " tag "\n")

    (unless mini
      (insert "\n* References\n# Local Variables:\n# eval: (add-hook 'after-save-hook (lambda ()(org-babel-tangle)) nil t)\n# End:\n"))
    )
  )

;;(defun blog-mode-start-hugo ()
;;  "Starts up a hugo watch process"
;;  (interactive)
;;  (let* (
;;         (default-directory "/home/wschenk/willschenk.com")
;;         (height (/ (frame-total-lines) 3))
;;         (name "*shell hugo process"))
;;    (delete-other-windows)
;;    (split-window-vertically (- height))
;;    (other-window 1)
;;    (switch-to-buffer name)
;;    (unless (get-buffer-process name)
;;      (async-shell-command "cd /home/wschenk/willschenk.com;./dev.sh" name))
;;    (async-shell-command "sleep 5;xdg-open http://localhost:1313" (get-buffer "*hugo web opener*"))))

(global-set-key (kbd "C-x e") 'blog-list)
(global-set-key (kbd "C-x w") 'org2blog-user-interface)
;; Restrict buffer to 80 character limit

;;'(c-max-one-liner-length 80)

;;'(fill-column 80)

;; Max. chars per line (auto-fill-mode)
(add-hook 'text-mode-hook #'auto-fill-mode)
(add-hook 'prog-mode-hook #'auto-fill-mode)
(setq-default fill-column 80)
;; Org-weather

;; Load the org-weather library
;;(add-to-list 'load-path "~/.emacs.d/org-weather")
;;(require 'org-weather)
;; Set your location and refresh the data
;;(setq org-weather-location "Kolkata,IN")
;;(setq org-weather-api-key  "783c9abf98d154e05236ccd5f4a0a914")
;;(setq org-weather-api-url "http://api.openweathermap.org/data/2.5/weather?q=%s&mode=json&units=metric&APPID=%s")
;;(setq org-weather-format "Weather: %desc, %tmin-%tmax%tu, %p%pu, %h%hu, %s%su")
;;(org-weather-refresh)


;; Reload/evaluate this file i.e .emacs after change

(defun reload-dotemacs ()
  (interactive)
  (load-file "~/.emacs"))
(global-set-key (kbd "C-c r") 'reload-dotemacs)

;; Open books.org file

(defun org-open-books-file ()
  (interactive)
  (find-file "~/.emacs.d/OrgFiles/books.org"))
(global-set-key (kbd "C-c n b") 'org-open-books-file)

;; Open contacts.org file

(defun org-open-contacts-file ()
  (interactive)
  (find-file "~/.emacs.d/OrgFiles/contacts.org"))
(global-set-key (kbd "C-c n c") 'org-open-contacts-file)


;; Open notes.org file

(defun org-open-notes-file ()
  (interactive)
  (find-file "~/.emacs.d/OrgFiles/notes.org"))
(global-set-key (kbd "C-c n n") 'org-open-notes-file)

;; Open task.org file

(defun org-open-task-file ()
  (interactive)
  (find-file "~/.emacs.d/OrgFiles/task.org"))
(global-set-key (kbd "C-c o") 'org-open-task-file)

;; Open refile.org file

(defun org-open-refile-file ()
  (interactive)
  (find-file "~/.emacs.d/OrgFiles/refile.org"))
(global-set-key (kbd "C-c n r") 'org-open-refile-file)

;; Open diary.org file

(defun org-open-dairy-file ()
  (interactive)
  (find-file "~/.emacs.d/OrgFiles/diary.org"))
(global-set-key (kbd "C-c n a") 'org-open-dairy-file)

;; Open emacs.org file

(defun org-open-dotemacs-file ()
  (interactive)
  (find-file "~/.emacs.d/OrgFiles/emacs.org"))
(global-set-key (kbd "C-c n e") 'org-open-dotemacs-file)

;; Open the journal.org file

(defun org-open-journal-file ()
  (interactive)
  (find-file "~/.emacs.d/OrgFiles/journal.org"))
(global-set-key (kbd "C-c n j") 'org-open-journal-file)

;; org2blog base

(setq org2blog/wp-blog-alist
      '(("Unixbhaskar's Blog"
         :url "https://unixbhaskar.wordpress.com/xmlrpc.php"
         :username "unixbhaskar")))
(setq org2blog/wp-image-upload t)


;; Dashboard

;; (require 'dashboard)
;; (dashboard-setup-startup-hook)
;; ;; Or if you use use-package
;; (use-package dashboard
;;   :ensure t
;;   :config
;;   (dashboard-setup-startup-hook))

;; Set the title
;;(setq dashboard-banner-logo-title "Emacs Dashboard")
;; Set the banner
;; (setq dashboard-startup-banner [2])
;; ;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever image/text you would prefer

;; Content is not centered by default. To center, set
;; (setq dashboard-center-content t)

;; To disable shortcut "jump" indicators for each section, set
 ;; (setq dashboard-show-shortcuts nil)

;; (setq dashboard-items '(
;;			(recents  . 5)
;;                        (bookmarks . 5)
                        ;; (projects . 5)))
;;                        (agenda . 5)
;;                        (registers . 5)

;; Custom items
;; (defun dashboard-insert-custom (list-size)
;;  (insert "Custom text"))
;;(add-to-list 'dashboard-item-generators  '(custom . dashboard-insert-custom))
;;(add-to-list 'dashboard-items '(custom) t)
;; (setq dashboard-set-heading-icons t)
;; (setq dashboard-set-file-icons t)
;; Modify heading icon with another icons

;;(dashboard-modify-heading-icons '((recents . "file-text")
;;                                  (bookmarks . "book")))

;; (setq dashboard-set-navigator t)

;; (setq dashboard-set-init-info t)
;; (setq dashboard-set-footer nil)

;; Customize footer icons

;;(setq dashboard-footer-messages '("Dashboard is pretty cool!"))
;;(setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
;;                                                   :height 1.1
;;                                                   :v-adjust -0.05
;;                                                   :face 'font-lock-keyword-face))


;; (setq dashboard-projects-switch-function 'counsel-projectile-switch-project-by-name)
;; (add-to-list 'dashboard-items '(agenda) t)
;; (setq dashboard-week-agenda t)
;; (setq dashboard-org-agenda-categories '("Tasks" "Diary" "Notes"))
;; (setq dashboard-filter-agenda-entry 'dashboard-no-filter-agenda)

(load "~/.emacs.d/org-link-minor-mode.el")


;; IRC

;; (add-to-list 'load-path "~/.emacs.d/erc-sasl.el")
;; ;; Require ERC-SASL package
;; (require 'erc-sasl)

;; ;; Add SASL server to list of SASL servers (start a new list, if it did not exist)
;; (add-to-list 'erc-sasl-server-regexp-list "irc\\.libera\\.chat")

;; ;; Redefine/Override the erc-login() function from the erc package, so that
;; ;; it now uses SASL
;; (defun erc-login ()
;;   "Perform user authentication at the IRC server. (PATCHED)"
;;   (erc-log (format "login: nick: %s, user: %s %s %s :%s"
;;            (erc-current-nick)
;;            (user-login-name)
;;            (or erc-system-name (system-name))
;;            erc-session-server
;;            erc-session-user-full-name))
;;   (if erc-session-password
;;       (erc-server-send (format "PASS %s" erc-session-password))
;;     (message "Logging in without password"))
;;   (when (and (featurep 'erc-sasl) (erc-sasl-use-sasl-p))
;;     (erc-server-send "CAP REQ :sasl"))
;;   (erc-server-send (format "NICK %s" (erc-current-nick)))
;;   (erc-server-send
;;    (format "USER %s %s %s :%s"
;;        ;; hacked - S.B.
;;        (if erc-anonymous-login erc-email-userid (user-login-name))
;;        "0" "*"
;;        erc-session-user-full-name))
;;   (erc-update-mode-line))
;; Set our nickname & real-name as constant variables
(setq
 erc-nick "unixbhaskar"     ; my IRC nick
 erc-user-full-name "Bhaskar Chowdhury") ; Our /whois name

;; Define a function to connect to a server
(defun some-serv ()
  (lambda ()
  (interactive)
  (erc :server "irc.libera.chat"
       :port   "6667")))

;; TLS version

;; This example is also using erc's TLS capabilities:
(global-set-key "\C-ce"
  (lambda ()
  (interactive)
  (erc-tls :server "irc.libera.chat"
           :port   "6697")

;; Autojoin irc channel

(require 'erc-join)
(erc-autojoin-enable)

(setq erc-autojoin-channels-alist
      '(("irc.libera.chat"  "#linux" "#kernel" "#git" "#emacs" "#vim" "#sysadmin")))))
;; Image-dired

(global-set-key (kbd "C-c i m") 'image-dired)
;; comment line

;; (global-set-key (kbd ";") 'comment-line)
;; ;; comment region

;; (global-set-key (kbd ";;") 'comment-region)


;; Save a macro for future sessions

(defun save-macro (name)
    "save a macro. Take a name as argument
     and save the last defined macro under
     this name at the end of your .emacs"
     (interactive "SName of the macro: ")  ;; ask for the name of the macro
     (kmacro-name-last-macro name)         ;; use this name for the macro
     (find-file user-init-file)            ;; open ~/.emacs or other user init file
     (goto-char (point-max))               ;; go to the end of the .emacs
     (newline)                             ;; insert a newline
     (insert-kbd-macro name)               ;; copy the macro
     (newline)                             ;; insert a newline
     (switch-to-buffer nil))               ;; return to the initial buffer

(global-set-key (kbd "C-c m") 'save-macro)
;; Dictionary

(global-set-key (kbd "C-c d") 'dictionary-search)


;; Wikipedia search
;;(defun wikipedia-search (search-term)
;;  "Search for SEARCH-TERM on wikipedia"
;;  (interactive
;;   (let ((term (if mark-active
;;                   (buffer-substring (region-beginning) (region-end))
;;                 (word-at-point))))
;;     (list
;;      (read-string
;;       (format "Wikipedia (%s):" term) nil nil term)))
;;   )
;;  (browse-url
;;   (concat
;;    "https://en.wikipedia.org/wiki/"
;;    search-term
;;    ))
;;  )
;;
;;(global-set-key (kbd "C-c w") 'wikipedia-search)


;; Undo

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))
;; Doom-modeline

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

;; Whether to use hud instead of default bar. It's only respected in GUI.
;;(defcustom doom-modeline-hud t)

;; The limit of the window width.
;; If `window-width' is smaller than the limit, some information won't be displayed.
(setq doom-modeline-window-width-limit fill-column)

;; Whether display icons in the mode-line.
;; While using the server mode in GUI, should set the value explicitly.
(setq doom-modeline-icon (display-graphic-p))

;; Whether display the icon for `major-mode'. It respects `doom-modeline-icon'.
(setq doom-modeline-major-mode-icon t)

;; Whether display the colorful icon for `major-mode'.
;; It respects `all-the-icons-color-icons'.
(setq doom-modeline-major-mode-color-icon t)

;; Whether display the icon for the buffer state. It respects `doom-modeline-icon'.
(setq doom-modeline-buffer-state-icon t)

;; Whether display the modification icon for the buffer.
;; It respects `doom-modeline-icon' and `doom-modeline-buffer-state-icon'.
(setq doom-modeline-buffer-modification-icon t)

;; Whether to use unicode as a fallback (instead of ASCII) when not using icons.
(setq doom-modeline-unicode-fallback nil)

;; Whether display the minor modes in the mode-line.
(setq doom-modeline-minor-modes nil)

;; If non-nil, a word count will be added to the selection-info modeline segment.
(setq doom-modeline-enable-word-count nil)

;; Major modes in which to display word count continuously.
;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
;; If it brings the sluggish issue, disable `doom-modeline-enable-word-count' or
;; remove the modes from `doom-modeline-continuous-word-count-modes'.
(setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))

;; Whether display the buffer encoding.
(setq doom-modeline-buffer-encoding t)

;; Whether display the indentation information.
(setq doom-modeline-indent-info t)

;; If non-nil, only display one number for checker information if applicable.
(setq doom-modeline-checker-simple-format t)

;; The maximum number displayed for notifications.
(setq doom-modeline-number-limit 99)

;; The maximum displayed length of the branch name of version control.
(setq doom-modeline-vcs-max-length 12)

;; Whether display the workspace name. Non-nil to display in the mode-line.
(setq doom-modeline-workspace-name t)

;; Whether display the perspective name. Non-nil to display in the mode-line.
(setq doom-modeline-persp-name t)

;; If non nil the default perspective name is displayed in the mode-line.
(setq doom-modeline-display-default-persp-name nil)

;; If non nil the perspective name is displayed alongside a folder icon.
(setq doom-modeline-persp-icon t)

;; Whether display the `lsp' state. Non-nil to display in the mode-line.
(setq doom-modeline-lsp t)

;; Whether display the GitHub notifications. It requires `ghub' package.
(setq doom-modeline-github t)

;; The interval of checking GitHub.
(setq doom-modeline-github-interval (* 30 60))

;; Whether display the modal state icon.
;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
(setq doom-modeline-modal-icon t)

;; Whether display the mu4e notifications. It requires `mu4e-alert' package.
(setq doom-modeline-mu4e t)

;; Whether display the gnus notifications.
(setq doom-modeline-gnus t)

;; Wheter gnus should automatically be updated and how often (set to 0 or smaller than 0 to disable)
(setq doom-modeline-gnus-timer 2)

;; Wheter groups should be excludede when gnus automatically being updated.
(setq doom-modeline-gnus-excluded-groups '("dummy.group"))

;; Whether display the IRC notifications. It requires `circe' or `erc' package.
(setq doom-modeline-irc t)

;; Function to stylize the irc buffer names.
(setq doom-modeline-irc-stylize 'identity)

;; Whether display the environment version.
(setq doom-modeline-env-version t)
;; Or for individual languages
(setq doom-modeline-env-enable-python t)
(setq doom-modeline-env-enable-ruby t)
(setq doom-modeline-env-enable-perl t)
(setq doom-modeline-env-enable-go t)
(setq doom-modeline-env-enable-elixir t)
(setq doom-modeline-env-enable-rust t)

;; Change the executables to use for the language version string
(setq doom-modeline-env-python-executable "python")
(setq doom-modeline-env-ruby-executable "ruby")
(setq doom-modeline-env-perl-executable "perl")
(setq doom-modeline-env-go-executable "go")
(setq doom-modeline-env-elixir-executable "iex")
(setq doom-modeline-env-rust-executable "rustc")

;; What to display as the version while a new one is being loaded
(setq doom-modeline-env-load-string "...")

;; Hooks that run before/after the modeline version string is updated
(setq doom-modeline-before-update-env-hook nil)
(setq doom-modeline-after-update-env-hook nil)

;; How tall the mode-line should be. It's only respected in GUI.
;; If the actual char height is larger, it respects the actual height.
(setq doom-modeline-height 10)

;; How wide the mode-line bar should be. It's only respected in GUI.
(setq doom-modeline-bar-width 2)

;; Change the modeline color
(set-face-attribute 'mode-line nil
                    :background "#353644"
                    :foreground "white"
                    :box '(:line-width 8 :color "#353644")
                    :overline nil
                    :underline nil)

(set-face-attribute 'mode-line-inactive nil
                    :background "#565063"
                    :foreground "white"
                    :box '(:line-width 8 :color "#565063")
                    :overline nil
                    :underline nil)


;; Enhance M-x with counsel

(use-package smex)
;; General has to be loaded before pass

(use-package general
  :ensure t
  :config)

;; Integration with pass

(use-package pass
  :general
  (:keymaps 'pass-view-mode-map "C-c C-y" 'pass-view-copy-password))
;; Shrinking file path

(use-package shrink-path
  :ensure t
  :demand t)
;; Hide the emphesis markers in org mode

(setq org-hide-emphasis-markers t)
(font-lock-add-keywords
 'org-mode
 '(("^ *\\([-]\\) "
    (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
;; Org Roam

(use-package emacsql
  :defer nil)
(use-package emacsql-sqlite
  :after emacsql
  :defer nil)

(use-package org-roam
      :ensure t
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory (file-truename "~/.emacs.d/OrgFiles/"))
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph))
               ("C-c n t" . org-roam-dailies-today)
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))

(add-hook 'after-init-hook 'org-roam-mode)

;; Deft
(use-package deft
  :after org
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-directory "~/.emacs.d/OrgFiles/")
  (deft-recursive t)
  (deft-use-filename-as-title t)
  (deft-use-filter-string-for-filename t)
  (deft-file-naming-rules '((noslash . "-")
                            (nospace . "-")
                            (case-fn . downcase)))
  (deft-org-mode-title-prefix t)
  (deft-extensions '("org" "txt" "text" "md" "markdown" "org.gpg"))
  (deft-default-extension "org"))
;; org-download C-M-y
(use-package org-download
  :after org
  :defer nil
  :custom
  (org-download-method 'directory)
  (org-download-image-dir "images")
  (org-download-heading-lvl nil)
  (org-download-timestamp "%Y%m%d-%H%M%S_")
  (org-image-actual-width 300)
  :bind
  ("C-M-y" .
   (lambda (&optional noask)
     (interactive "P")
     (let ((file
            (if (not noask)
                (read-string (format "Filename [%s]: " org-download-screenshot-basename)
                             nil nil org-download-screenshot-basename)
              nil)))
       (org-download-clipboard file))))
  :config
  (require 'org-download))
;; Org-protocol redefined to work with browser i.e firefox Not working

;;(defun transform-square-brackets-to-round-ones(string-to-transform)
;;  "Transforms [ into ( and ] into ), other chars left unchanged."
;;  (concat
;;  (mapcar #'(lambda (c) (if (equal c ?[) ?\( (if (equal c ?]) ?\) c))) string-to-transform))
;;  )

;;(setq org-capture-templates `(
;;	("p" "Protocol" entry (file+headline ,(concat org-directory "notes.org"))
;;        "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
;;	("L" "Protocol Link" entry (file+headline ,(concat org-directory "notes.org"))
;;         "* %? [[%:link][%:description]] %(progn (setq kk/delete-frame-after-capture 2) \"\")\nCaptured On: %U"
;; :empty-lines 1)
;;))
;; package-install shortcut
(global-set-key (kbd "M-p") 'package-install)
;; Customization shortcut
(global-set-key (kbd "C-x n c") 'customize)
;; Restart emacs
(global-set-key (kbd "C-x n r") 'restart-emacs)

;; Customized theme
(global-set-key (kbd "C-x n t") 'customize-themes)

;; Rainbow delimiter

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Explicit priorities than A,B,C

(use-package org-fancy-priorities
 :diminish
 :demand t
 :defines org-fancy-priorities-list
 :hook (org-mode . org-fancy-priorities-mode)
 :config
 (unless (char-displayable-p ?❗)
 (setq org-fancy-priorities-list '("HIGH" "MID" "LOW" "OPTIONAL"))))

;; Symbola font

(when (member "Symbola" (font-family-list))
 (set-fontset-font "fontset-default" nil
 (font-spec :size 20 :name "Symbola")))

;; Abbrevation

(setq abbrev-file-name             ;; tell emacs where to read abbrev
        "~/.emacs.d/abbrev_defs")    ;; definitions from...
(setq save-abbrevs 'silent)        ;; save abbrevs when files are saved

 (setq-default abbrev-mode t)

;; Kill buffer with less keystroke

(global-set-key (kbd "C-q") 'kill-this-buffer)

;; Copy emacs.org to dotfile repo

(fset 'org-emacs-copy
   (kmacro-lambda-form [?\M-! ?o ?r ?g ?- ?e ?m ?a ?c ?s ?- ?c ?o ?p ?y return] 0 "%d"))

(global-set-key (kbd "C-c n o") 'org-emacs-copy)


;; Projectile

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-project-search-path '("~/projects/"))

;; Magit-org-todos

(use-package magit-org-todos
  :config
  (magit-org-todos-autoinsert))

;; Linux kernel development settings
(setq c-default-style "linux")
(require 'xcscope)
(cscope-setup)

;; I3window config org file copy to dotfile repo

(fset 'copy-Orgi3window-config
   (kmacro-lambda-form [?\C-x ?\C-s ?\M-! ?/ ?h ?o ?m ?e ?/ ?b ?h ?a ?s ?k ?a ?r ?/ ?b ?i ?n ?/ ?o ?r ?g ?- ?i ?3 ?w ?i ?n ?d ?o ?w ?- ?c ?o ?n ?f ?i ?g return] 0 "%d"))

(global-set-key (kbd "C-c i c") 'copy-Orgi3window-config)

;; I3Window config file open

 (fset 'open_i3config_orgfile
    (kmacro-lambda-form [?\C-x ?\C-f ?. ?e ?m ?a ?c ?s ?. ?d ?/ ?O ?r ?g ?F ?i ?l ?e ?s ?/ ?i ?3 backspace backspace ?i ?3 ?c ?o ?n ?f ?i ?g ?. ?o ?r ?g return] 0 "%d"))

(global-set-key (kbd "C-c i w") 'open_i3config_orgfile)

;; Start pinentry service on start
;;(pinentry-start)

;; Dired git mode
(add-hook 'dired-mode-hook 'dired-git-mode)

;; Find and open shell init files

(global-set-key (kbd "C-c i s") 'crux-find-shell-init-file)

;; Reopen the present file as root mode

(global-set-key (kbd "C-c i r") 'crux-reopen-as-root-mode)

;; Open emacs init and emacs org file side by side

(fset 'emacs-init-and-org-file-side-by-side
   (kmacro-lambda-form [?\C-c ?i ?e ?\C-x ?3 ?\C-x ?\C-f ?. ?e ?m ?a ?c ?s ?. ?d ?/ ?o ?r ?g ?F ?i ?l ?e ?s ?/ ?e ?m ?a ?c ?s ?. ?o ?r ?g return] 0 "%d"))

(global-set-key (kbd "C-c i i") 'emacs-init-and-org-file-side-by-side)

;; Header info skeleton for org file
(define-skeleton org-header-skeleton
"Header info for an Org file."
"Title: ""#+TITLE:" str " \n"
"#+AUTHOR: " user-full-name "\n"
"#+EMAIL: " user-mail-address "\n"
"#+DATE: " (format-time-string "%Y-%m-%d-%X") "\n")
;;"#+OPTIONS: "  ^:nil  "\n"
;; "#+ATTR_HTML: " :class wp-block-image size-full "\n"
;; "#+ATTR_HTML: " :align center "\n"
(global-set-key (kbd "C-c i h") 'org-header-skeleton)

 ;; To create empty org file

(fset 'create-empty-org-file
   (kmacro-lambda-form [?\C-x ?\C-f ?. ?e ?m ?a ?c ?s ?. ?d ?/ ?O ?r ?g ?F ?i ?l ?e ?s ?/ ?t ?e ?s ?t ?. ?o ?r ?g return return] 0 "%d"))

(defun org+-buffer-name-to-title (&optional end)
  "Rename buffer to value of #+TITLE:.
If END is non-nil search for #+TITLE: at `point' and
delimit it to END.
Start an unlimited search at `point-min' otherwise."
  (interactive)
  (let ((beg (or (and end (point))
         (point-min))))
    (save-excursion
      (when end
    (goto-char end)
    (setq end (line-end-position)))
      (goto-char beg)
      (when (re-search-forward "^[[:space:]]*#\\+TITLE:[[:space:]]*\\(.*?\\)[[:space:]]*$" end t)
    (rename-buffer (match-string 1)))))
  nil)

(defun org+-buffer-name-to-title-config ()
  "Configure Org to rename buffer to value of #+TITLE:."
  (font-lock-add-keywords nil '(org+-buffer-name-to-title)))

(add-hook 'org-mode-hook #'org+-buffer-name-to-title-config)

(global-set-key (kbd "C-c i o") 'create-empty-org-file)

;; Load dired+ features
(add-to-list 'load-path "~/.emacs.d/diredplus")
   (require 'dired+)

;; Load icicles
;;(add-to-list 'load-path "~/.emacs.d/icicles/")
;;(require 'icicles)
;;(icy-mode 1)

;; Bookmark+

(add-to-list 'load-path "~/.emacs.d/bookmarkplus/")
 (require 'bookmark+)

;; Exchnage buffer position

(global-set-key (kbd "C-c x") 'crux-transpose-windows)

;; mu4e marks

(add-to-list 'mu4e-marks
  '(tag
     :char       "g"
     :prompt     "gtag"
     :ask-target (lambda () (read-string "What tag do you want to add?"))
     :action      (lambda (docid msg target)
                    (mu4e-action-retag-message msg (concat "+" target)))))

(add-to-list 'mu4e-marks
  '(archive
     :char       "A"
     :prompt     "Archive"
     :show-target (lambda (target) "archive")
     :action      (lambda (docid msg target)
                    ;; must come before proc-move since retag runs
                    ;; 'sed' on the file
                    (mu4e-action-retag-message msg "-\\Inbox")
                    (mu4e~proc-move docid nil "+S-u-N"))))

(mu4e~headers-defun-mark-for tag)
(mu4e~headers-defun-mark-for archive)
(define-key mu4e-headers-mode-map (kbd "g") 'mu4e-headers-mark-for-tag)
(define-key mu4e-headers-mode-map (kbd "A") 'mu4e-headers-mark-for-archive)

;; To copy dot emacs to dotfiles repo plus local backup folder after edit and save

(add-hook 'local-write-file-hooks 'copy_dot_emacs_to_dotfiles_repo)
(defun copy_dot_emacs_to_dotfiles_repo ()
  "write the file in two places"
  (let ((orig (buffer-file-name)))
    (write-file (concat "/home/bhaskar/dotfiles/" (file-name-nondirectory orig)) nil)
    (write-file (concat "/data/dotfiles/" (file-name-nondirectory orig))nil)

    (write-file orig nil)))

;; Make one window maximize ,then come back to grid

(defun toggle-maximize-buffer () "Maximize buffer"
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_)
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))
(global-set-key (kbd "C-c f") 'toggle-maximize-buffer)

;; Make use of counsel feature for search file.

(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;; Open dot emacs init file and org emacs file side by side

(fset 'open_dot_emacs_and_org_emacs_side_by_side
   (kmacro-lambda-form [?\C-x ?\C-f ?. ?e ?m ?a ?c ?s down down return ?\C-x ?3 ?\C-x ?\C-f ?. ?e ?m ?a ?c ?s ?. ?d ?/ ?O ?r ?g ?F ?i ?l ?e ?s ?/ ?e ?m ?a ?c ?s down ?. ?o ?r ?g return] 0 "%d"))

(global-set-key (kbd "C-c i i") 'open_dot_emacs_and_org_emacs_side_by_side)

;; Magit Status
(global-set-key (kbd "C-x g") 'magit-status)

;; Aliases
;;(load "alias")

;; EMMS notification

; choose D-Bus to disseminate messages, if it is running.
(cond
 ;; test to see if D-Bus notifications are available
 ((if (and (require 'dbus nil t)
	   (dbus-ping :session "org.freedesktop.Notifications"))
      (progn
	(setq notify-method 'notify-via-dbus-notifications)
	(require 'notifications))))
 ;; could use the message system otherwise
 (t (setq notify-method 'notify-via-message)))

(defun notify-via-notifications (title msg icon)
  "Send notification with TITLE, MSG via `D-Bus'."
  (notifications-notify
   :title title
   :body msg
   :app-icon icon
   :urgency 'low))

(defun notify-via-messages (title msg)
  "Send notification with TITLE, MSG to message."
  (message "APPOINTMENT: %s" msg))

(defun emms-notifications-dbus (track-name)
  "Share track name via `D-Bus'."
  (let ((icon "/usr/share/icons/gnome/24x24/categories/applications-multimedia.png"))
    (notify-via-notifications "EMMS is now playing:" track-name icon)))

(defun emms-notifications-message (track-name)
  "Share track name via Emacs minibuffer."
  (message "EMMS is now playing: %s" track-name))

(setq emms-player-next-function 'emms-notify-and-next)

(defun emms-notify-and-next ()
  "Send a notification of track and start next."
  (emms-next-noerror)
  (let ((track-name (emms-track-description (emms-playlist-current-selected-track))))
    (cond
     ((eq notify-method 'notify-via-dbus-notifications)
      (emms-notifications-dbus track-name))
     (t (emms-notifications-message track-name)))))

 ;; i3config and i3 org config file side by side
(fset 'i3config-and-i3orgconfig-side-by-side
   (kmacro-lambda-form [?\C-x ?\C-f ?. ?i ?t ?h ?r down return ?\C-x ?3 ?\C-x ?\C-f ?. ?e ?m ?a ?c ?s ?. ?d ?/ ?O ?r ?g ?f ?i ?l ?e backspace backspace backspace backspace ?F ?i ?l ?e ?s ?/ down down down down down down down ?i ?3 ?c ?o ?n ?f ?i ?g ?. ?o ?r ?g return] 0 "%d"))

(global-set-key (kbd "C-c n w") 'i3config-and-i3orgconfig-side-by-side)

;; Get a shell quickly
(global-set-key (kbd "C-c n s") 'shell)

;; Switch between buffers
(global-set-key [(control right)] 'next-buffer)
(global-set-key [(control left)] 'previous-buffer)

;; helm mini
(global-set-key (kbd "<C-tab>") 'helm-mini)

;; Default directory
(setq default-directory "~/")

;; Samrt Compile
(global-set-key (kbd "C-c C-r")'smart-compile)
(setq compilation-read-command nil)

;; Describe variables
(global-set-key (kbd "C-h v")'counsel-describe-variable)

;; Describe function
(global-set-key (kbd "C-h f")'counsel-describe-function)

;; Move text or region of text up and down by hold Meta+up/down
(move-text-default-bindings)

;; All about Org mode Clocking

;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)
;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)
;; Do not prompt to resume an active clock, just resume it
(setq org-clock-persist-query-resume nil)

;; Change tasks to whatever when clocking in
(setq org-clock-in-switch-to-state "NEXT")
;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)
;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)
;; use pretty things for the clocktable
(setq org-pretty-entities t)

;; Prettify Symbol mode enable
(global-prettify-symbols-mode t)

;; Vertico and Marginilia mode enabled
(vertico-mode t)
(marginalia-mode t)

;; Embark
(use-package embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;; Switching theme based on daytime

(use-package circadian
  :ensure t
  :config
  (setq calendar-latitude 22.572645)
  (setq calendar-longitude 88.363892)
  (setq circadian-themes '((:sunrise . solarized-dark-high-contrast)
                           (:sunset  . molokai)))
  (circadian-setup))

;; Org-roam V2 migration
(setq org-roam-v2-ack t)

;; Elfeed marking and unmarking
;; (defalias 'elfeed-toggle-star
;;   (elfeed-expose #'elfeed-search-toggle-all 'star))

;; (eval-after-load 'elfeed-search
;;   '(define-key elfeed-search-mode-map (kbd "m") 'elfeed-toggle-star))

;; ;; face for starred articles
;; (defface elfeed-search-star-title-face
;;   '((t :foreground "#f77"))
;;   "Marks a starred Elfeed entry.")

;; (push '(star elfeed-search-star-title-face) elfeed-search-face-alist)

;; Mutiple-Cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Git timemachine
(add-to-list 'load-path "~/.emacs.d/git-timemachine/git-timemachine.el")

;; Making window split direction easy

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x |") 'toggle-window-split)

;; i3 integration
;; (require 'i3)
;;(require 'i3-integration)
(add-to-list 'load-path "~/.emacs.d/i3-emacs/")
;;(i3-one-window-per-frame-mode-on)


;; Do not need an empty scratch buffer
(kill-buffer "*scratch*")

;; Load persistent highling with tooltip
;; (load ov-highlight.el)

;; This is for vterm-toggle to other buffer
(global-set-key (kbd "C-c n t") 'vterm-toggle)

;; To restrict elfeed for 1 month duration
(setq-default elfeed-search-filter "@1-month-ago +unread ")

;; Play youtube url in mpv
(defun mpv-play-url (url &rest args)
  "youtube videos"
  (interactive)
  (message "just a sec...video will start soon")
  (start-process "mpv" nil "mpv" url))


;; browse url open in default browser
(setq browse-url-browser-function
      (quote
	(("youtu\.?be" . mpv-play-url)
	 ("." . browse-url-default-browser))))

;; PopUp manipulations
(popper-mode 1)

(global-set-key (kbd "C-c i p") 'popper-cycle)
(global-set-key (kbd "C-c i l") 'popper-toggle-latest)
(global-set-key (kbd "C-c i e") 'popper-echo-mode)
(global-set-key (kbd "C-c i k") 'popper-kill-latest-popup)
(global-set-key (kbd "C-c i y") 'popper-toggle-type)

;; Special character mode

(defmacro ins-val (val)
  `(lambda () (interactive) (insert ,val)))

(define-minor-mode special-char-mode
  "Toggle Special Character mode"
  nil
  " SpecialChar"
  `(
    (,(kbd "1") . ,(ins-val "!")) (,(kbd "!") . ,(ins-val "1")) (,[kp-1] . ,(ins-val "1"))
    (,(kbd "2") . ,(ins-val "@")) (,(kbd "@") . ,(ins-val "2")) (,[kp-2] . ,(ins-val "2"))
    (,(kbd "3") . ,(ins-val "#")) (,(kbd "#") . ,(ins-val "3")) (,[kp-3] . ,(ins-val "3"))
    (,(kbd "4") . ,(ins-val "$")) (,(kbd "$") . ,(ins-val "4")) (,[kp-4] . ,(ins-val "4"))
    (,(kbd "5") . ,(ins-val "%")) (,(kbd "%") . ,(ins-val "5")) (,[kp-5] . ,(ins-val "5"))
    (,(kbd "6") . ,(ins-val "^")) (,(kbd "^") . ,(ins-val "6")) (,[kp-6] . ,(ins-val "6"))
    (,(kbd "7") . ,(ins-val "&")) (,(kbd "&") . ,(ins-val "7")) (,[kp-7] . ,(ins-val "7"))
    (,(kbd "8") . ,(ins-val "*")) (,(kbd "*") . ,(ins-val "8")) (,[kp-8] . ,(ins-val "8"))
    (,(kbd "9") . ,(ins-val "(")) (,(kbd "(") . ,(ins-val "9")) (,[kp-9] . ,(ins-val "9"))
    (,(kbd "0") . ,(ins-val ")")) (,(kbd ")") . ,(ins-val "0")) (,[kp-0] . ,(ins-val "0"))
    (,[kp-multiply] . ,(ins-val "*"))
    )
  :global 'true)

(global-set-key (kbd "C-!") 'special-char-mode)
(put 'narrow-to-region 'disabled nil)

;; Stop creating backup files and put all the backup file in single directory
(setq make-backup-files nil)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 10   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; Call up proced ,which system process viewer
;; (global-set-key (kbd "C-c h t") 'proced')

;; xclip helps to copy from system clipboard
(xclip-mode 1)

;; For Sudo edit

(global-set-key (kbd "C-c s e") 'sudo-edit)


;; Kill whole word at once

(defun kill-whole-word()
  (interactive)
  (backward-word)
  (kill-word 1) )
(global-set-key (kbd "C-c w w") 'kill-whole-word)


;; Copy whole line
(defun copy-whole-line()
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
      (point-at-eol)))))
(global-set-key (kbd "C-c w l") 'copy-whole-line)

;; Move the cursor to the switched window
(defun split-and-follow-horizontally()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

;; Open scratch buffer

(global-set-key (kbd "C-x n s") 'scratch)

;; Open pocket reader

(global-set-key (kbd "C-c n p") 'pocket-reader)

;; Convenience for M-x on terminal

(global-set-key (kbd "C-x C-m") 'execute-extended-command)

;; Stop creating backup files

(setq make-backup-files nil)
