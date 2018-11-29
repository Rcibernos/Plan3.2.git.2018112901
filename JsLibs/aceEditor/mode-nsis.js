define("ace/mode/nsis_highlight_rules",["require","exports","module","ace/lib/oop","ace/mode/text_highlight_rules"],function(e,a,b){var d=e("../lib/oop");var f=e("./text_highlight_rules").TextHighlightRules;var c=function(){this.$rules={start:[{token:"keyword.compiler.nsis",regex:/^\s*!(?:include|addincludedir|addplugindir|appendfile|cd|delfile|echo|error|execute|packhdr|finalize|getdllversion|system|tempfile|warning|verbose|define|undef|insertmacro|macro|macroend|makensis|searchparse|searchreplace)\b/,caseInsensitive:true},{token:"keyword.command.nsis",regex:/^\s*(?:Abort|AddBrandingImage|AddSize|AllowRootDirInstall|AllowSkipFiles|AutoCloseWindow|BGFont|BGGradient|BrandingText|BringToFront|Call|CallInstDLL|Caption|ChangeUI|CheckBitmap|ClearErrors|CompletedText|ComponentText|CopyFiles|CRCCheck|CreateDirectory|CreateFont|CreateShortCut|Delete|DeleteINISec|DeleteINIStr|DeleteRegKey|DeleteRegValue|DetailPrint|DetailsButtonText|DirText|DirVar|DirVerify|EnableWindow|EnumRegKey|EnumRegValue|Exch|Exec|ExecShell|ExecWait|ExpandEnvStrings|File|FileBufSize|FileClose|FileErrorText|FileOpen|FileRead|FileReadByte|FileReadUTF16LE|FileReadWord|FileWriteUTF16LE|FileSeek|FileWrite|FileWriteByte|FileWriteWord|FindClose|FindFirst|FindNext|FindWindow|FlushINI|GetCurInstType|GetCurrentAddress|GetDlgItem|GetDLLVersion|GetDLLVersionLocal|GetErrorLevel|GetFileTime|GetFileTimeLocal|GetFullPathName|GetFunctionAddress|GetInstDirError|GetLabelAddress|GetTempFileName|Goto|HideWindow|Icon|IfAbort|IfErrors|IfFileExists|IfRebootFlag|IfSilent|InitPluginsDir|InstallButtonText|InstallColors|InstallDir|InstallDirRegKey|InstProgressFlags|InstType|InstTypeGetText|InstTypeSetText|IntCmp|IntCmpU|IntFmt|IntOp|IsWindow|LangString|LicenseBkColor|LicenseData|LicenseForceSelection|LicenseLangString|LicenseText|LoadLanguageFile|LockWindow|LogSet|LogText|ManifestDPIAware|ManifestSupportedOS|MessageBox|MiscButtonText|Name|Nop|OutFile|Page|PageCallbacks|Pop|Push|Quit|ReadEnvStr|ReadINIStr|ReadRegDWORD|ReadRegStr|Reboot|RegDLL|Rename|RequestExecutionLevel|ReserveFile|Return|RMDir|SearchPath|SectionGetFlags|SectionGetInstTypes|SectionGetSize|SectionGetText|SectionIn|SectionSetFlags|SectionSetInstTypes|SectionSetSize|SectionSetText|SendMessage|SetAutoClose|SetBrandingImage|SetCompress|SetCompressor|SetCompressorDictSize|SetCtlColors|SetCurInstType|SetDatablockOptimize|SetDateSave|SetDetailsPrint|SetDetailsView|SetErrorLevel|SetErrors|SetFileAttributes|SetFont|SetOutPath|SetOverwrite|SetRebootFlag|SetRegView|SetShellVarContext|SetSilent|ShowInstDetails|ShowUninstDetails|ShowWindow|SilentInstall|SilentUnInstall|Sleep|SpaceTexts|StrCmp|StrCmpS|StrCpy|StrLen|SubCaption|Unicode|UninstallButtonText|UninstallCaption|UninstallIcon|UninstallSubCaption|UninstallText|UninstPage|UnRegDLL|Var|VIAddVersionKey|VIFileVersion|VIProductVersion|WindowIcon|WriteINIStr|WriteRegBin|WriteRegDWORD|WriteRegExpandStr|WriteRegStr|WriteUninstaller|XPStyle)\b/,caseInsensitive:true},{token:"keyword.control.nsis",regex:/^\s*!(?:ifdef|ifndef|if|ifmacrodef|ifmacrondef|else|endif)\b/,caseInsensitive:true},{token:"keyword.plugin.nsis",regex:/^\s*\w+::\w+/,caseInsensitive:true},{token:"keyword.operator.comparison.nsis",regex:/[!<>]?=|<>|<|>/},{token:"support.function.nsis",regex:/(?:\b|^\s*)(?:Function|FunctionEnd|Section|SectionEnd|SectionGroup|SectionGroupEnd|PageEx|PageExEnd)\b/,caseInsensitive:true},{token:"support.library.nsis",regex:/\${[\w\.:-]+}/},{token:"constant.nsis",regex:/\b(?:ARCHIVE|FILE_ATTRIBUTE_ARCHIVE|FILE_ATTRIBUTE_HIDDEN|FILE_ATTRIBUTE_NORMAL|FILE_ATTRIBUTE_OFFLINE|FILE_ATTRIBUTE_READONLY|FILE_ATTRIBUTE_SYSTEM|FILE_ATTRIBUTE_TEMPORARY|HIDDEN|HKCC|HKCR|HKCU|HKDD|HKEY_CLASSES_ROOT|HKEY_CURRENT_CONFIG|HKEY_CURRENT_USER|HKEY_DYN_DATA|HKEY_LOCAL_MACHINE|HKEY_PERFORMANCE_DATA|HKEY_USERS|HKLM|HKPD|HKU|IDABORT|IDCANCEL|IDD_DIR|IDD_INST|IDD_INSTFILES|IDD_LICENSE|IDD_SELCOM|IDD_UNINST|IDD_VERIFY|IDIGNORE|IDNO|IDOK|IDRETRY|IDYES|MB_ABORTRETRYIGNORE|MB_DEFBUTTON1|MB_DEFBUTTON2|MB_DEFBUTTON3|MB_DEFBUTTON4|MB_ICONEXCLAMATION|MB_ICONINFORMATION|MB_ICONQUESTION|MB_ICONSTOP|MB_OK|MB_OKCANCEL|MB_RETRYCANCEL|MB_RIGHT|MB_RTLREADING|MB_SETFOREGROUND|MB_TOPMOST|MB_USERICON|MB_YESNO|MB_YESNOCANCEL|NORMAL|OFFLINE|READONLY|SHCTX|SHELL_CONTEXT|SW_HIDE|SW_SHOWDEFAULT|SW_SHOWMAXIMIZED|SW_SHOWMINIMIZED|SW_SHOWNORMAL|SYSTEM|TEMPORARY)\b/,caseInsensitive:true},{token:"constant.library.nsis",regex:/\${(?:AtLeastServicePack|AtLeastWin7|AtLeastWin8|AtLeastWin10|AtLeastWin95|AtLeastWin98|AtLeastWin2000|AtLeastWin2003|AtLeastWin2008|AtLeastWin2008R2|AtLeastWinME|AtLeastWinNT4|AtLeastWinVista|AtLeastWinXP|AtMostServicePack|AtMostWin7|AtMostWin8|AtMostWin10|AtMostWin95|AtMostWin98|AtMostWin2000|AtMostWin2003|AtMostWin2008|AtMostWin2008R2|AtMostWinME|AtMostWinNT4|AtMostWinVista|AtMostWinXP|IsNT|IsServer|IsServicePack|IsWin7|IsWin8|IsWin10|IsWin95|IsWin98|IsWin2000|IsWin2003|IsWin2008|IsWin2008R2|IsWinME|IsWinNT4|IsWinVista|IsWinXP)}/},{token:"constant.language.boolean.true.nsis",regex:/\b(?:true|on)\b/},{token:"constant.language.boolean.false.nsis",regex:/\b(?:false|off)\b/},{token:"constant.language.option.nsis",regex:/(?:\b|^\s*)(?:(?:un\.)?components|(?:un\.)?custom|(?:un\.)?directory|(?:un\.)?instfiles|(?:un\.)?license|uninstConfirm|admin|all|auto|both|bottom|bzip2|current|force|hide|highest|ifdiff|ifnewer|lastused|leave|left|listonly|lzma|nevershow|none|normal|notset|right|show|silent|silentlog|textonly|top|try|user|Win10|Win7|Win8|WinVista|zlib)\b/,caseInsensitive:true},{token:"constant.language.slash-option.nsis",regex:/\b\/(?:a|BRANDING|CENTER|COMPONENTSONLYONCUSTOM|CUSTOMSTRING=|date|e|ENABLECANCEL|FILESONLY|file|FINAL|GLOBAL|gray|ifempty|ifndef|ignorecase|IMGID=|ITALIC|LANG=|NOCUSTOM|noerrors|NONFATAL|nonfatal|oname=|o|REBOOTOK|redef|RESIZETOFIT|r|SHORT|SILENT|SOLID|STRIKE|TRIM|UNDERLINE|utcdate|windows|x)\b/,caseInsensitive:true},{token:"constant.numeric.nsis",regex:/\b(?:0(?:x|X)[0-9a-fA-F]+|[0-9]+(?:\.[0-9]+)?)\b/},{token:"entity.name.function.nsis",regex:/\$\([\w\.:-]+\)/},{token:"storage.type.function.nsis",regex:/\$[\w]+/},{token:"punctuation.definition.string.begin.nsis",regex:/`/,push:[{token:"punctuation.definition.string.end.nsis",regex:/`/,next:"pop"},{token:"constant.character.escape.nsis",regex:/\$\\./},{defaultToken:"string.quoted.back.nsis"}]},{token:"punctuation.definition.string.begin.nsis",regex:/"/,push:[{token:"punctuation.definition.string.end.nsis",regex:/"/,next:"pop"},{token:"constant.character.escape.nsis",regex:/\$\\./},{defaultToken:"string.quoted.double.nsis"}]},{token:"punctuation.definition.string.begin.nsis",regex:/'/,push:[{token:"punctuation.definition.string.end.nsis",regex:/'/,next:"pop"},{token:"constant.character.escape.nsis",regex:/\$\\./},{defaultToken:"string.quoted.single.nsis"}]},{token:["punctuation.definition.comment.nsis","comment.line.nsis"],regex:/(;|#)(.*$)/},{token:"punctuation.definition.comment.nsis",regex:/\/\*/,push:[{token:"punctuation.definition.comment.nsis",regex:/\*\//,next:"pop"},{defaultToken:"comment.block.nsis"}]},{token:"text",regex:/(?:!include|!insertmacro)\b/}]};this.normalizeRules()};c.metaData={comment:"\n\ttodo: - highlight functions\n\t",fileTypes:["nsi","nsh"],name:"NSIS",scopeName:"source.nsis"};d.inherits(c,f);a.NSISHighlightRules=c});define("ace/mode/folding/cstyle",["require","exports","module","ace/lib/oop","ace/range","ace/mode/folding/fold_mode"],function(g,b,d){var e=g("../../lib/oop");var f=g("../../range").Range;var a=g("./fold_mode").FoldMode;var c=b.FoldMode=function(h){if(h){this.foldingStartMarker=new RegExp(this.foldingStartMarker.source.replace(/\|[^|]*?$/,"|"+h.start));this.foldingStopMarker=new RegExp(this.foldingStopMarker.source.replace(/\|[^|]*?$/,"|"+h.end))}};e.inherits(c,a);(function(){this.foldingStartMarker=/(\{|\[)[^\}\]]*$|^\s*(\/\*)/;this.foldingStopMarker=/^[^\[\{]*(\}|\])|^[\s\*]*(\*\/)/;this.singleLineBlockCommentRe=/^\s*(\/\*).*\*\/\s*$/;this.tripleStarBlockCommentRe=/^\s*(\/\*\*\*).*\*\/\s*$/;this.startRegionRe=/^\s*(\/\*|\/\/)#?region\b/;this._getFoldWidgetBase=this.getFoldWidget;this.getFoldWidget=function(l,h,k){var j=l.getLine(k);if(this.singleLineBlockCommentRe.test(j)){if(!this.startRegionRe.test(j)&&!this.tripleStarBlockCommentRe.test(j)){return""}}var i=this._getFoldWidgetBase(l,h,k);if(!i&&this.startRegionRe.test(j)){return"start"}return i};this.getFoldWidgetRange=function(p,h,o,j){var l=p.getLine(o);if(this.startRegionRe.test(l)){return this.getCommentRegionBlock(p,l,o)}var m=l.match(this.foldingStartMarker);if(m){var k=m.index;if(m[1]){return this.openingBracketBlock(p,m[1],o,k)}var n=p.getCommentFoldRange(o,k+m[0].length,1);if(n&&!n.isMultiLine()){if(j){n=this.getSectionRange(p,o)}else{if(h!="all"){n=null}}}return n}if(h==="markbegin"){return}var m=l.match(this.foldingStopMarker);if(m){var k=m.index+m[0].length;if(m[1]){return this.closingBracketBlock(p,m[1],o,k)}return p.getCommentFoldRange(o,k,-1)}};this.getSectionRange=function(m,l){var j=m.getLine(l);var o=j.search(/\S/);var p=l;var n=j.length;l=l+1;var h=l;var k=m.getLength();while(++l<k){j=m.getLine(l);var i=j.search(/\S/);if(i===-1){continue}if(o>i){break}var q=this.getFoldWidgetRange(m,"all",l);if(q){if(q.start.row<=p){break}else{if(q.isMultiLine()){l=q.end.row}else{if(o==i){break}}}}h=l}return new f(p,n,h,m.getLine(h).length)};this.getCommentRegionBlock=function(p,j,o){var q=j.search(/\s*$/);var l=p.getLength();var r=o;var n=/^\s*(?:\/\*|\/\/|--)#?(end)?region\b/;var h=1;while(++o<l){j=p.getLine(o);var k=n.exec(j);if(!k){continue}if(k[1]){h--}else{h++}if(!h){break}}var i=o;if(i>r){return new f(r,q,i,j.length)}}}).call(c.prototype)});define("ace/mode/nsis",["require","exports","module","ace/lib/oop","ace/mode/text","ace/mode/nsis_highlight_rules","ace/mode/folding/cstyle"],function(g,a,d){var f=g("../lib/oop");var h=g("./text").Mode;var e=g("./nsis_highlight_rules").NSISHighlightRules;var b=g("./folding/cstyle").FoldMode;var c=function(){this.HighlightRules=e;this.foldingRules=new b();this.$behaviour=this.$defaultBehaviour};f.inherits(c,h);(function(){this.lineCommentStart=[";","#"];this.blockComment={start:"/*",end:"*/"};this.$id="ace/mode/nsis"}).call(c.prototype);a.Mode=c});