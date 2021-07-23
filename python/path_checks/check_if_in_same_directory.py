import os

def path_isin(child, parent):
    """Check if given `child` path is inside `parent`."""

    def normalize_path(path):
        return os.path.normpath(path)

    parent = os.path.join(normalize_path(parent), "")
    child = normalize_path(child)

    print('Parent   : %s' % parent)
    print('Child    : %s' % child)

    return child != parent and child.startswith(parent)

path = 'git_dir/testfile'
root = 'execroot/git_dir'

print('Root     : %s' % root)
print('Path     : %s' % path)
print('Realpath : %s' % os.path.realpath(path))
print('Normpath : %s' % os.path.normpath(path))
print('Abspath  : %s' % os.path.abspath(path))
print('')

if not path_isin(os.path.abspath('subdir/testfile'), os.path.abspath(root)):
    print('File is not inside directory.')
else:
    print('File is inside directory.')

