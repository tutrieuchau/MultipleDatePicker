**Version 1.0.0**
# Multiple Datepicker
#####A production of SaiGonApps Team from VietNam.
I really like Datepicker of Android version and hate the default DatePicker of iOS. I searched on the internet a library which have layout look like Android verion,but i couldn't find anything.
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
If you want customize it. Please contact me by email nguyenductamwind@gmail.com I will help you customize it.
You just need to send me a cup of coffy for that.@(^-^)@
### Demo
*Screenshots are currently taken from the original repository, as they render exactly the same :-)*
- **Multiple Date Picker (Drag to select)**
![alt tag](https://i.ibb.co/4SvnRxC/demo1.png)
 - **Multiple Month Picker (Select start and end year)**
![alt tag](https://i.ibb.co/GTVsxpj/demo3.png)

 - **Multiple Year Picker (Select start and end year)**
![alt tag](https://i.ibb.co/j6P9w3L/demo2.png)


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