## FFT_Helper
 A small Action Bar to help exploring FFT/Frequency domain images in FIJI.
 
### Installation
 Unzip the ActionBar .zip into the plugins filder of your FIJI installation.
 
## Usage
Run the ActionBarbar through Plugins › ActionBar › FFT Helper or the command finder.

<img src="https://github.com/LiorPytowski/FFT_Helper/blob/main/ActionBar_snapshot.png" alt="ActionBar_snapshot" width="366" height="110">

Open an image then run Forward_FFT. 
One the FFT Image create regions of interest to exclude. For this draw a ROI, add to the ROI manager (Shortcut: T) then mirror if necessary.
No need to erase anything from the FFT image: when running Reverse_FFT it will automatically create the corresponding image of both the FFT excluding the selection or only including the selection.

## Demo
The sample image below can be found in File › Open Samples › Comparing Lengths. The sample image was converted to 80Bit then inverted before running the Forward_FFT.
<img src="https://github.com/LiorPytowski/FFT_Helper/blob/main/demo_pt1.png" alt="Demo" width="774" height="444">

Running Reverse_FFT from the toolbar will output the 2 images below:
<img src="https://github.com/LiorPytowski/FFT_Helper/blob/main/demo_pt2.png" alt="Demo" width="712" height="317">

## To do
Fix typos :)

Add the ability to batch process files with the created mask.

### Acknowledgements
This ActionBar is built thanks to: 

1. Mutterer, J. Custom toolbars and mini applications with Action Bar. (2017) doi:10.6084/m9.figshare.3397603.v12.