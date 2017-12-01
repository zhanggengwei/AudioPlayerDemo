Pod::Spec.new do |s|
 s.name     = 'AudioPlayerDemo'
 s.version  = '1.0'
 s.license  = 'MIT'
 s.summary  = 'An atuo fit size tagView on iOS.'
 s.homepage = 'https://github.com/zhanggengwei/AudioPlayerDemo'
 s.authors  = { '非著名程序员' => 'm13716920635@163.com' }
 s.source   = { :git => 'https://github.com/zhanggengwei/AudioPlayerDemo.git', :tag => s.version }
 s.requires_arc = true
 s.ios.deployment_target = '8.0'
 s.source_files = 'AudioPlayerDemo/Audio/*.{h,m}'
 end




