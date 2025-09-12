project('timer', 'vala', version: '0.1.0', default_options: ['werror=false'])

adw_dep = dependency('libadwaita-1')

subdir('data')
subdir('src')

gresources = gnome.compile_resources(
  'resources',
  'data/resources.xml',
  source_dir: 'data',
  c_name: 'timer'
)

executable(
  'timer',
  sources: ['src/MainWindow.vala', 'src/main.vala', gresources],
  dependencies: [dependency('libadwaita-1')]
)
