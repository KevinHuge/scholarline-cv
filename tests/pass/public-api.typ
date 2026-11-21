// The documented public API must stay importable by name.
#import "/lib.typ": cv, contact, section, education, experience, publication, project, award, skill-line, default-theme, default-header, default-heading, default-section, margin-section, default-links, underline-links, section-label, cv-theme, cv-icon, entry, entry-title, entry-meta, entry-links, dot-join
#assert.eq(type(default-theme), dictionary)
