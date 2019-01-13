# -*- coding: utf-8 -*-
# Copyright (C) 2018-2019 Greg Beam, KI7MT
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

import os
import setuptools

import wsprcsv

here = os.path.dirname(os.path.abspath(__file__))

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name=wsprcsv.__title__,
    version=wsprcsv.__version__,
    author=wsprcsv.__author__,
    license=wsprcsv.__license__,
    author_email=wsprcsv.__email__,
    long_description=long_description,
    long_description_content_type="text/markdown",

    python_requires='>=3.5.*',
    project_urls={
        'Packaging tutorial': 'https://packaging.python.org/tutorials/distributing-packages/',
        'WSPRCSV source': 'https://github.com/KI7MT/python-pypi-packages/tree/master/wsprcsv/',
},
    packages=setuptools.find_packages(),
    install_requires=[],
    entry_points={
    'console_scripts': ['wsprcsv = wsprcsv.__main__:main'],
    },
    classifiers=[
        "Natural Language :: English",
        "Development Status :: 4 - Beta",
        "Intended Audience :: Science/Research",
        "Topic :: Utilities",
        "License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
        "Operating System :: MacOS :: MacOS X",
        "Operating System :: POSIX",
        "Operating System :: POSIX :: BSD",
        "Operating System :: POSIX :: Linux",
        "Operating System :: Microsoft :: Windows",
        "Programming Language :: Python",
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        ],
    url='https://github.com/KI7MT/python-pypi-packages/tree/master/wsprcsv',
)
