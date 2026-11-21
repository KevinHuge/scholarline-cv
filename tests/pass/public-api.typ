// The documented public API must stay importable by name.
#import "/lib.typ": cv, contact, section, education, experience, publication, project, award, skill-line, default-theme, default-header, default-heading, cv-theme, cv-icon, entry, entry-title, entry-meta, dot-join, bracket-links
#assert.eq(type(default-theme), dictionary)
