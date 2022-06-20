//
//  LocaleFileFormat.swift
//  OneSkyClient
//
//  Created by Raj Sathianarayanan on 6/20/22.
//

import Foundation

public enum LocaleFileFormat: String {
    case iOSStrings = "IOS_STRINGS"
    case iOSStringsDict = "IOS_STRINGSDICT_XML"
    case androidXML = "ANDROID_XML"
    case androidJSON = "ANDROID_JSON"
    case javaProperties = "JAVA_PROPERTIES"
    case html = "HTML"
    case resW = "RESW"
    case yml = "YML"
    case yaml = "YAML"
    case xliff = "XLIFF"

// TODO: Add these.
//    GNU_PO
//    RUBY_YML
//    RUBY_YAML
//    FLASH_XML
//    GNU_POT
//    RRC
//    RESX
//    HIERARCHICAL_JSON (common key-value JSON format)
//    PHP
//    PHP_SHORT_ARRAY (Alternative array syntax supported by PHP >= 5.4)
//    PHP_VARIABLES
//    ADEMPIERE_XML
//    IDEMPIERE_XML
//    QT_TS_XML
//    RESJSON (a Microsoft defined format)
//    TMX
//    L10N
//    INI
//    REQUIREJS
}
