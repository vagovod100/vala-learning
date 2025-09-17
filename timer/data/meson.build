subdir('ui')

gresources = gnome.compile_resources(
  'resources',
  'resources.xml',
  source_dir: meson.current_build_dir(),
  c_name: 'timer',
  dependencies: custom_target(
    'blueprints',
    input: blueprints,
    output: '.',
    command: [
      find_program('blueprint-compiler'),
      'batch-compile',
      '@OUTPUT@',
      '@CURRENT_SOURCE_DIR@',
      '@INPUT@',
    ],
  ),
)

timer_resources = gresources
