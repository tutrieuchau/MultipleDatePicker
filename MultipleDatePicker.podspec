Pod::Spec.new do |s|
s.name             = 'MultipleDatePicker'
s.version          = '1.0.0'
s.summary          = 'Multiple Date Picker for Date, month, year picker'

s.description      = <<-DESC
Multiple Date Picker for Date, month, year picker create by Trieu Chau From VietNam
DESC

s.homepage         = 'https://github.com/tutrieuchau/MultipleDatePicker'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'TrieuChau' => 'tutrieuchau@gmail.com' }
s.source           = { :git => 'https://github.com/tutrieuchau/MultipleDatePicker.git', :tag => 'master' }

s.ios.deployment_target = '10.0'
s.source_files = 'MultipleDatePicker'
s.resources = 'MultipleDatePicker/*.{xib,xcassets}'
s.resource_bundles = {
  'MultipleDatePickerImages' => ['MultipleDatePicker/Images.xcassets']
}
s.swift_version = '5.0'

end
