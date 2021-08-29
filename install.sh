#!/bin/bash

# Cloning Remote upstream repository and merging with the functionalities

echo -e "Starting installation script!"
echo -e "Cloning Remote upstream repository..."
git clone https://github.com/root-project/root.git
echo -e "Merging files..."

# Copying LinkDef file for PyMVA
cp tmva/pymva/inc/LinkDef.h root/tmva/pymva/inc/

# Copying CMake file for PyMVA
cp tmva/pymva/CMakeLists.txt root/tmva/pymva/

# Copying Include files for PyMVA
cp tmva/pymva/inc/TMVA/RModelParser_Keras.h root/tmva/pymva/inc/TMVA/
cp tmva/pymva/inc/TMVA/RModelParser_PyTorch.h root/tmva/pymva/inc/TMVA/
cp tmva/pymva/inc/TMVA/PyMethodBase.h root/tmva/pymva/inc/TMVA/

# Copying Source files for PyMVA
cp tmva/pymva/src/RModelParser_Keras.cxx root/tmva/pymva/src/
cp tmva/pymva/src/RModelParser_PyTorch.cxx root/tmva/pymva/src/
cp tmva/pymva/src/PyMethodBase.cxx root/tmva/pymva/src/

# Copying Test files for PyMVA
cp tmva/pymva/test/CMakeLists.txt root/tmva/pymva/test/
cp tmva/pymva/test/EmitFromKeras.cxx root/tmva/pymva/test/
cp tmva/pymva/test/EmitFromPyTorch.cxx root/tmva/pymva/test/
cp tmva/pymva/test/generateKerasModelFunctional.py root/tmva/pymva/test/
cp tmva/pymva/test/generateKerasModelSequential.py root/tmva/pymva/test/
cp tmva/pymva/test/generatePyTorchModelModule.py root/tmva/pymva/test/
cp tmva/pymva/test/generatePyTorchModelSequential.py root/tmva/pymva/test/
cp tmva/pymva/test/TestRModelParserKeras.C root/tmva/pymva/test/
cp tmva/pymva/test/TestRModelParserPyTorch.C root/tmva/pymva/test/

# Copying CMake files for SOFIE
cp tmva/sofie/CMakeLists.txt root/tmva/sofie/

# Copying LinkDef file for SOFIE
cp tmva/sofie/inc/LinkDef.h root/tmva/sofie/inc/

# Copying Include files for SOFIE
cp tmva/sofie/inc/TMVA/RModel.hxx root/tmva/sofie/inc/TMVA/
cp tmva/sofie/inc/TMVA/ROperator.hxx root/tmva/sofie/inc/TMVA/
cp tmva/sofie/inc/TMVA/ROperator_Gemm.hxx root/tmva/sofie/inc/TMVA/
cp tmva/sofie/inc/TMVA/ROperator_Relu.hxx root/tmva/sofie/inc/TMVA/
cp tmva/sofie/inc/TMVA/ROperator_Transpose.hxx root/tmva/sofie/inc/TMVA/
cp tmva/sofie/inc/TMVA/SOFIE_common.hxx root/tmva/sofie/inc/TMVA/

# Copying Source files for SOFIE
cp tmva/sofie/src/RModel.cxx root/tmva/sofie/src/
cp tmva/sofie/src/SOFIE_common.cxx root/tmva/sofie/src/

# Copying Test files for SOFIE
cp tmva/sofie/test/CMakeLists.txt root/tmva/sofie/test/
cp tmva/sofie/test/EmitFromRoot.cxx root/tmva/sofie/test/
cp tmva/sofie/test/TestCustomModelsFromROOT.cxx root/tmva/sofie/test/

# Copying CMake files for TMVA
cp tmva/tmva/CMakeLists.txt root/tmva/tmva/

# Copying LinkDef file for TMVA
cp tmva/tmva/inc/LinkDef.h root/tmva/tmva/inc/

# Copying Include files for TMVA
cp tmva/tmva/inc/TMVA/RootStorageBDT.h root/tmva/tmva/inc/TMVA/

# Copying Source files for TMVA
cp tmva/tmva/src/RootStorageBDT.cxx root/tmva/tmva/src/

# Making the Build & Install directory
mkdir build install && cd build

# Preparing the build files
cmake -DCMAKE_INSTALL_PREFIX=../install  -Dtmva-sofie=ON -Dtesting=ON -Droottest=ON  ../root

# Building the project and installing
cmake --build . --target install -j4

# Setting up ROOT environment
source ../install/bin/thisroot.sh
