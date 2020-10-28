public let testSchemesPlist_Input_XML =
"""
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
   <dict>
      <key>SchemeUserState</key>
      <dict>
         <key>dict.xcscheme_^#shared#^_</key>
         <dict>
            <key>orderHint</key>
            <integer>4</integer>
         </dict>
         <key>dict wire meaningsToEntries.xcscheme</key>
         <dict>
            <key>isShown</key>
            <true />
            <key>orderHint</key>
            <integer>3</integer>
         </dict>
         <key>dict load inflectedForms.xcscheme</key>
         <dict>
            <key>isShown</key>
            <true />
            <key>orderHint</key>
            <integer>5</integer>
         </dict>
         <key>DictBuilder.xcscheme_^#shared#^_</key>
         <dict>
            <key>orderHint</key>
            <integer>2</integer>
         </dict>
         <key>DictLoader.xcscheme_^#shared#^_</key>
         <dict>
            <key>orderHint</key>
            <integer>1</integer>
         </dict>
         <key>DictLoaderLibTests.xcscheme_^#shared#^_</key>
         <dict>
            <key>isShown</key>
            <false />
            <key>orderHint</key>
            <integer>0</integer>
         </dict>
      </dict>
      <key>SuppressBuildableAutocreation</key>
      <dict>
         <key>1742903424F2768000B49BEC</key>
         <dict>
            <key>primary</key>
            <true />
         </dict>
         <key>1787D7E924E8B8E7002198E1</key>
         <dict>
            <key>primary</key>
            <true />
         </dict>
         <key>1787D87824E8C3EB002198E1</key>
         <dict>
            <key>primary</key>
            <true />
         </dict>
         <key>1787D88024E8C3EC002198E1</key>
         <dict>
            <key>primary</key>
            <true />
         </dict>
         <key>17D6E19C24FB6BE2003E6CF5</key>
         <dict>
            <key>primary</key>
            <true />
         </dict>
      </dict>
   </dict>
</plist>
"""

public let testSchemesPlist_ExpectedOutput_XML =
"""
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
   <dict>
      <key>SchemeUserState</key>
      <dict>
         <key>dict.xcscheme_^#shared#^_</key>
         <dict>
            <key>orderHint</key>
            <integer>0</integer>
         </dict>
         <key>dict load inflectedForms.xcscheme</key>
         <dict>
            <key>isShown</key>
            <true />
            <key>orderHint</key>
            <integer>1</integer>
         </dict>
         <key>dict wire meaningsToEntries.xcscheme</key>
         <dict>
            <key>isShown</key>
            <true />
            <key>orderHint</key>
            <integer>2</integer>
         </dict>
         <key>DictBuilder.xcscheme_^#shared#^_</key>
         <dict>
            <key>orderHint</key>
            <integer>3</integer>
         </dict>
         <key>DictLoader.xcscheme_^#shared#^_</key>
         <dict>
            <key>orderHint</key>
            <integer>4</integer>
         </dict>
         <key>DictLoaderLibTests.xcscheme_^#shared#^_</key>
         <dict>
            <key>isShown</key>
            <false />
            <key>orderHint</key>
            <integer>5</integer>
         </dict>
      </dict>
      <key>SuppressBuildableAutocreation</key>
      <dict>
         <key>1742903424F2768000B49BEC</key>
         <dict>
            <key>primary</key>
            <true />
         </dict>
         <key>1787D7E924E8B8E7002198E1</key>
         <dict>
            <key>primary</key>
            <true />
         </dict>
         <key>1787D87824E8C3EB002198E1</key>
         <dict>
            <key>primary</key>
            <true />
         </dict>
         <key>1787D88024E8C3EC002198E1</key>
         <dict>
            <key>primary</key>
            <true />
         </dict>
         <key>17D6E19C24FB6BE2003E6CF5</key>
         <dict>
            <key>primary</key>
            <true />
         </dict>
      </dict>
   </dict>
</plist>
"""
