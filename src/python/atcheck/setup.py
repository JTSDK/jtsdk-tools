# -*- coding: utf-8 -*-
# Copyright (C) 2019 Greg Beam
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
#
#-------------------------------------------------------------------------------
import os
import setuptools

import atcheck

here = os.path.dirname(os.path.abspath(__file__))

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name=atcheck.__name__,
    version=atcheck.__version__,
    author=atcheck.__author__,
    license=atcheck.__license__,
    author_email=atcheck.__email__,
    long_description=long_description,
    long_description_content_type="text/markdown",
    include_package_data=True,
    python_requires='>=3.5.*',
    project_urls={
        'JTSDK-Tools Project': 'https://github.com/KI7MT/jtsdk-tools',
        'atcheck source': 'https://github.com/KI7MT/jtsdk-tools/src/python/atcheck',
    },
    packages=setuptools.find_packages(),
    install_requires=[],
    package_data={},
    entry_points={
    'console_scripts': ['atcheck = atcheck.__main__:main'],
    },
    zip_safe=False,
    classifiers=[
        "Natural Language :: English",
        "Development Status :: 2 - Pre-Alpha",
        "Intended Audience :: Developers",
        "Topic :: Communications :: Ham Radio",
        "License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
        "Operating System :: MacOS :: MacOS X",
        "Operating System :: POSIX :: Linux",
        "Operating System :: Microsoft :: Windows",
        "Programming Language :: Python",
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        ],
    url='https://github.com/KI7MT/jtsdk-tools/src/python/atcheck',
 )
