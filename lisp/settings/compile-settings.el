(defun erjoalgo-compile-disable-query-on-proc-exit (proc)
  (set-process-query-on-exit-flag proc nil))

(add-hook 'compilation-start-hook 'erjoalgo-compile-disable-query-on-proc-exit)

(defvar compilation-interpret-ansi-color nil)

(setf compilation-interpret-ansi-color t);; todo make buffer-local and mode-local

(defun maybe-colorize-compilation-buffer ()
  ;; (require 'ansi-color)
  ;; https://stackoverflow.com/questions/3072648/
  (when compilation-interpret-ansi-color
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region compilation-filter-start (point)))))

(add-hook 'compilation-filter-hook 'maybe-colorize-compilation-buffer)
