 <h1>
Root Storage of Deep Learning Models in TMVA
	</h1>
  
  ![REPO_SIZE](https://img.shields.io/github/repo-size/sanjibansg/GSoC21-RootStorage?style=for-the-badge)
   ![TOTAL_LINES](https://img.shields.io/tokei/lines/github/sanjibansg/GSoC21-RootStorage?style=for-the-badge)
   ![LICENSE](https://img.shields.io/github/license/sanjibansg/GSoC21-RootStorage?style=for-the-badge)
   ![CHECKS](https://img.shields.io/github/checks-status/sanjibansg/GSoC21-RootStorage/main?style=for-the-badge)
<br />  

**This project was a part of Google Summer of Code 2021 under the organization CERN-HSF**
	<br/><a href="https://summerofcode.withgoogle.com/projects/#5424575602491392">Link to Project Page</a>
<br/>

<h2>
Project Details
</h2>  

| <!-- -->    | <!-- -->    |
|-------------|-------------|
| **Student's Name**         | Sanjiban Sengupta          |
| **Mentors**   |  Lorenzo Moneta, Sitong An, Anirudh Dagar |
| **Organization** | Root-Project (CERN-HSF)  |
| **Organization Code Repository** | https://github.com/root-project/root  |
| **Final Report** | https://github.com/sanjibansg/GSoC21-RootStorage/wiki  |
| **Code Implementations** | https://github.com/root-project/root/pulls?q=author:sanjibansg |
| **Project Proposal** | https://docs.google.com/document/d/1MVKpGP9lr0tUhrxB59nrNlZfAtnO_Dgkx8ddw1k26Yk/edit?usp=sharing  |
|  **Documentation Blog** | https://blog.sanjiban.ml/series/gsoc |

<br/>
<h2> 
About Project
	</h2>
The Toolkit for Multivariate Data Analysis (TMVA) is a sub-module of ROOT which provides a machine learning environment for conducting the training, testing, and evaluation of various multivariate methods especially used in High-energy Physics. Recently, the TMVA team introduced <b>SOFIE</b> (<i>System for Fast Inference code Emit</i>) which facilitates its own intermediate representation of deep learning models following the ONNX standards. To facilitate the usage, storage, and exchange of these models, this project aimed at developing the storage functionality of Deep Learning models in the `.root` format, popular in the High Energy Physics community.

<h3>
Project Contents
	</h3>
</center>
<ol>
	<li>Functionality for serialization of RModel for storing a trained deep learning model in `.root` format.</li>
	<li>Functionality for parsing a Keras `.h5` file into a RModel object for generation of inference code.</li>
	<li>Functionality for parsing a PyTorch `.pt` file into a RModel object for generation of inference code.</li>
	<li>Tests,Tutorials & Documentations for various parsers of TMVA SOFIE's RModel object.</li>
	<li>Funcationality for Intermediate Representation of BDT Models and Parsing of TMVA trained BDT models</li>
	</ol>
<br/>
<h2>
Tech Stack
</h2>	
<ul>
	<li> 
		<b>Languages: </b> C/C++, Python</li>
	<li><b>Deep Learning Libraries: </b> Keras, PyTorch</li>
	<li><b>API: </b> C-Python API</li>
	<li><b>Build: </b> CMake</li>
	<li><b>Tests: </b> GTest Framework</li>
	<li><b>Documentation: </b> DOxygen</li>

</ul>
<br/>
<h2>
Installation
</h2>
Installation Steps for building ROOT from source can be found here 

[https://root.cern/install/build_from_source/](https://root.cern/install/build_from_source/)

Provided `install.sh` can also be used which directly builds the repository and merges the implemented code files

```
git clone https://github.com/sanjibansg/GSoC21-RootStorage.git
cd GSoC21-RootStorage
./install.sh
```
<br/>
<h2>
Interface
</h2>
<ul>
<li>
<b>Serialization of RModel</b>

```
//Writing ROOT File
TFile file("model.root","CREATE");
using namespace TMVA::Experimental;
SOFIE::RModel model = SOFIE::PyKeras::Parse("trained_model_dense.h5");
model.Write("model");
file.Close();

//Reading ROOT File
TFile file("model.root","READ");
using namespace TMVA::Experimental;
SOFIE::RModel *model;
file.GetObject("model",model);
file.Close();
```

</li>
<br/>
<li>
	<b>Keras Converter for RModel</b>

```
//Parser returns a RModel object
using TMVA::Experimental::SOFIE;
RModel model = PyKeras::Parse("trained_model_dense.h5");

//Converter writes a ROOT file directly
PyKeras::ConvertToRoot(“trained_model_dense.h5”);
```

</li>
<br/>
<li>
	<b> PyTorch Converter for RModel</b>

```
//Parser returns a RModel object
using TMVA::Experimental::SOFIE;

//Building the vector for input shapes
std::vector<size_t> s1{120,1};
std::vector<std::vector<size_t>> inputShape{s1};
RModel model = PyTorch::Parse("trained_model_dense.pt",inputShape);

//Converter write3s a ROOT file directly
std::vector<size_t> s1{120,1};
std::vector<std::vector<size_t>> shape{s1};
PyTorch::ConvertToRoot(“trained_model_dense.pt”,inputShape);
```
</li>
<br/>
<li>
	<b> Root Storage of BDT</b>

```
//Parser loads the BDT model from .xml to RootStorage::BDT object
TMVA::Experimental::RootStorage::BDT model;
bool usePurity = true;
model.Parse("TMVA_CNN_Classification_BDT.weights.xml",usePurity);
```

</li>
</ul>
<br/>
<h2>Future Plan</h2>
<ul>
<li>
Development of Root Storage of BDT
<ul>
	<li>Develop the mapping interface for inference code generation from class RootStorage::BDT</li>
	<li>Researching on the conversion of scikit-learn based BDT models to class RootStorage::BDT for subsequent inference</li>
	<li>Adding tests & tutorials for BDT</li>
	</ul>
	</li>
	<li> Adding Support for conversion of Convolution Layers from Keras and PyTorch models.</li>
	</ul>
<br/>
<h2>Contributions</h2>
 For existing bugs and adding more features open a issue <a href="https://github.com/sanjibansg/GSoC21-RootStorage/issues">here.</a>
