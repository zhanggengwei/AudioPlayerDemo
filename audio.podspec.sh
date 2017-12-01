# Pod::Spec.new do |s|
# s.name     = 'AudioPlayerDemo'
# s.version  = '1.0'
# s.license  = 'MIT'
# s.summary  = 'An atuo fit size tagView on iOS.'
# s.homepage = 'https://github.com/zhanggengwei/AudioPlayerDemo'
# s.authors  = { '非著名程序员' => 'm13716920635@163.com' }
# s.source   = { :git => 'https://github.com/zhanggengwei/AudioPlayerDemo.git', :tag => s.version }
# s.requires_arc = true
# s.ios.deployment_target = '8.0'
# s.source_files = 'AudioPlayerDemo/Audio/*.{h,m}'
# end


Pod::Spec.new do |s|
  s.name         = "AudioPlayerDemo"
  s.version      = "1.0"
  s.summary      = "AudioPlayerDemo player for stream data"
  s.description  = "AudioPlayerDemo player for "
  s.homepage     = "https://github.com/zhanggengwei/AudioPlayerDemo"
  s.license      = 'MIT'
  s.license      = {
     :type => 'MIT',
     :text => <<-LICENSE
               Copyright (C) 2012

               Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

               The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

               THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
               
     LICENSE
  }
  s.author       = { "zhanggengwei" => "m13716920635@163.com" }
  s.source       = { :git => "https://github.com/zhanggengwei/AudioPlayerDemo.git", :tag => "1.0" }
  s.platform     = :ios

  s.source_files = 'AudioPlayerDemo/Audio/*.{h,m}'
  s.framework = 'AudioToolbox'
  s.requires_arc = true
  s.ios.deployment_target = '8.0'

end

