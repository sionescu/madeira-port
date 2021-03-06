;;;; By Nikodemus Siivola <nikodemus@random-state.net>, 2012.
;;;;
;;;; Permission is hereby granted, free of charge, to any person
;;;; obtaining a copy of this software and associated documentation files
;;;; (the "Software"), to deal in the Software without restriction,
;;;; including without limitation the rights to use, copy, modify, merge,
;;;; publish, distribute, sublicense, and/or sell copies of the Software,
;;;; and to permit persons to whom the Software is furnished to do so,
;;;; subject to the following conditions:
;;;;
;;;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;;;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;;;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
;;;; IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
;;;; CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
;;;; TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
;;;; SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#.(unless (or #+asdf3 (asdf/driver:version<= "2.32" (asdf-version)))
    (error "You need ASDF >= 2.32 to load this system correctly."))

(defsystem :madeira-port
  :author "Nikodemus Siivola <nikodemus@random-state.net>"
  :version (:read-file-form "version.sexp")
  :licence "MIT"
  :description
  "Provides :MADEIRA-PORT file class for ASDF, and an extended #+ and #- syntax."
  :depends-on (:split-sequence)
  :components
  ((:file "madeira-port")))

(defsystem :madeira-port/tests
  :licence "MIT"
  :description "Tests for MADEIRA-PORT."
  :version (:read-file-form "version.sexp")
  :depends-on (:madeira-port :fiveam)
  :components
  ((:file "tests")))

(defmethod perform ((o test-op) (c (eql (find-system :madeira-port))))
  (load-system :madeira-port/tests :force '(:madeira-port/tests))
  (uiop:symbol-call :madeira-port-tests '#:run-tests))
