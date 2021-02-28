#
# Cython declaration for the zran_file_util library.
#
# Author: Paul McCarthy <pauldmccarthy@gmail.com>
#

from libc.stdio  cimport FILE
from libc.stdint cimport uint8_t, uint16_t, uint32_t, uint64_t, int64_t
from posix.types cimport off_t
from cpython.ref cimport PyObject


cdef extern from "zran_file_util.h":

    size_t _fread_python(void *ptr, size_t size, size_t nmemb, PyObject *f)
    
    uint64_t _ftell_python(PyObject *f)
    
    int _fseek_python(PyObject *f, long int offset, int whence)
    
    int _feof_python(PyObject *f, uint64_t size)
    
    int _ferror_python(PyObject *f)
    
    int _fflush_python(PyObject *f)
    
    size_t _fwrite_python(const void *ptr, size_t size, size_t nmemb, PyObject *f)
    
    int _getc_python(PyObject *f)

    int ferror_(FILE *fd, PyObject *f)

    int fseek_(FILE *fd, PyObject *f, long int offset, int whence)

    uint64_t ftell_(FILE *fd, PyObject *f)

    size_t fread_(void *ptr, size_t size, size_t nmemb, FILE *fd, PyObject *f)

    int feof_(FILE *fd, PyObject *f, uint64_t size)

    int fflush_(FILE *fd, PyObject *f)

    size_t fwrite_(const void *ptr, size_t size, size_t nmemb, FILE *fd, PyObject *f)

    int getc_(FILE *fd, PyObject *f)