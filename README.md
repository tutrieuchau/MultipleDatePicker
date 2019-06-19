**Version 1.0.0**
# Multiple Datepicker
A production of SaiGonApps Team from VietNam
I really like Datepicker of Android version and hate the default DatePicker of iOS. I searched on the internet a library which have layout look like Android verion,but i couldn't find anything
So I decided spend two dates in my life to creating something like that for me and someone who hate the default Datepicker of iOS
I hope you enjoy it.
##### One more heads up: As Swift evolves, if you are not using the latest Swift compiler, you shouldn't check out the master branch. Instead, you should go to the release page and pick up whatever suits you.

* Xcode 10.2 / Swift 5.0 (master branch)
* iOS >= 8.0 (Use as an **Embedded** Framework)
* macOS >= 10.11

**An amazing feature** of this library now, for Android, iOS, tvOS and macOS, is the time it saves you when developing for both platforms, as the learning curve is singleton- it happens only once, and the code stays very similar so developers don't have to go around and re-invent the app to produce the same output with a different library. (And that's not even considering the fact that there's not really another good choice out there currently...)

### Usage

##### In order to correctly compile:

1. Add it to your podfile: `pod 'MultipleDatePicker', :git => 'https://github.com/tutrieuchau/MultipleDatePicker.git'`
2. `@import MultipleDatePicker` 
3.  In your view set UIClass to `MultipleDatePicker`
4.  Handle date picker
       - Handle picker done in your viewcontroller by extend `MultipleDatePickerDelegate`
       - Override hook  `func onSelected(start: Date?, end: Date?)` 
       if you select single date `end: Date?` will be nil
### Troubleshooting and support
Currently, It has a lot of bugs and issues.
I will fix it as soon as i can.
If you want customize it. Please contact me by email nguyenductamwind@gmail.com
I will help you customize it. You just need to send me a cup of coffy for that.@(^-^)@
### Demo
*Screenshots are currently taken from the original repository, as they render exactly the same :-)*
- **Multiple Date Picker (Drag to select)**
![alt tag](https://previews.dropbox.com/p/thumb/AAcs3Y7unvMXkeWQEzlefYuncrzppyuaXANEkzo0CQscXiEr49fCFokczCGezqchRq5BJUF231vsci5y9hutumivj2HyucHcMBbPJzfPwBom_68RQwJ1NjPcCC817AFe_hgUO0T0ZVTmP1mkCyljy_tyGjARMuZhY9b2HgfloEGiInH_TJVSl_4zcle7k0an4dtp0XV8l_4_ZdQyROpo3sKxhzgjNSTGjIZbwftm7z4A4Q9Rhd-uUNGyDL55MfEFpK0xqsQS9gJpxeFZpJO-AiJKll5gNgthJPDqX3hXv9GDay8lMNRrnBAsXV1sZRHOklhdjgdfwo85TlPlbBITL__u9sApleIA7uDqg6csPAFGRA/p.png?fv_content=true&size_mode=5)
 - **Multiple Month Picker (Select start and end year)**
![alt tag](https://previews.dropbox.com/p/thumb/AAfkgjhXYIiQ64dz_T6InUqiwMlRlw8Xzia6PqHOMQnVwBHI5q82o4llrU67BAayK3q29QauZ9TAZpNIZ2IE00PQdyCw72EPe6GI8TBtJT1uuevKryE2ZuzxSUj8cDOtepEUMWNFNWEwMOkgMpa-q3D78-I7HDd7cyGqhpngq59bYqd7H-20ZwtfoFhlq00s4pzgllzj8FGn-kJI_pDRhtJURzmuqR2qfA7YZnciFIO7eq-NsTt53oa0XjLU-o6meKee9thGx0uccgjiZQ7YBJ2ctgP1bOych4e6z3mdaQam-iVYGSeQLYsJRNaopzZhdAMLLAPrAo_Z14kkGzjQiqEMlAYIPS-fGthi9_mqRao1HQ/p.png?fv_content=true&size_mode=5)

 - **Multiple Year Picker (Select start and end year)**
![alt tag](https://previews.dropbox.com/p/thumb/AAf1RHgvjzqKx1uCkc9T1dCWv3Ak7CapRGNHu61ciuCvsWEsQZzV7GggnWAvlltk4rRnmF0bVk2ptJI5l8q_3yDDWTxxeN9Uy3Mrq7jN2w2KryJZtKwfbanWi4xTvWIjMT5gc7GwH0NN7IhJFfN2lneq0Gt7GU_kz6KA_RkxlorJk0jcrYfEY5umxGVgeDPzUWAqs2Vxf_FHzO0ZnWAOSqXB-rRbmdsaEHM8p_aGn-uSUqh0PAlDr1Sgl2F8zZKbVDd7rdQSMkA-ct-KotmagORNJGBnw6NRbrWxMKNRmCTag_zACIk4vOxcKX1SkqWFilMRGGIzvpjtCRQKHfaSJMS3zl2r5DQNCEhw2p0aTZWEDQ/p.png?fv_content=true&size_mode=5)


License
=======
Copyright 2019 TrieuChau and SaiGonApp Team

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.