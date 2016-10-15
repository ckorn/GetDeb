Description: Disable plugin dialog. It uses a totally non-authenticated and non-trusted way of installing arbitrary code.
Author: Martin Pitt <mpitt@debian.org>
Bug-Debian: http://bugs.debian.org/640026

Index: calibre-2.70.0/src/calibre/gui2/actions/preferences.py
===================================================================
--- calibre-2.70.0.orig/src/calibre/gui2/actions/preferences.py	2016-10-14 19:23:19.142942082 +0200
+++ calibre-2.70.0/src/calibre/gui2/actions/preferences.py	2016-10-14 19:23:19.138941954 +0200
@@ -29,8 +29,6 @@
             pm.addAction(QIcon(I('config.png')), _('Preferences'), self.do_config)
         cm('welcome wizard', _('Run welcome wizard'),
                 icon='wizard.png', triggered=self.gui.run_wizard)
-        cm('plugin updater', _('Get plugins to enhance calibre'),
-                icon='plugins/plugin_updater.png', triggered=self.get_plugins)
         if not DEBUG:
             pm.addSeparator()
             cm('restart', _('Restart in debug mode'), icon='debug.png',
