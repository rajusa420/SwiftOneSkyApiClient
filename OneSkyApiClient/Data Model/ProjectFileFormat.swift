//
//  ProjectFileFormat.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/27/22.
//

import Foundation

enum ProjectFileFormat: String {
    case iOSStrings = "IOS_STRINGS"
    case iOSStringsDict = "IOS_STRINGSDICT_XML"
    case androidXml = "ANDROID_XML"
    case androidJson = "ANDROID_JSON"
    case javaProperties = "JAVA_PROPERTIES"
    case xliff = "XLIFF"
    case html = "HTML"
    case yml = "YML"
    case yaml = "YAML"
    case resw = "RESW"
    case hierarchicalJson = "HIERARCHICAL_JSON"

// Note: These are the other formats OneSky supports. If needed just add a constant for them
//    GNU_PO
//    RUBY_YML
//    RUBY_YAML
//    FLASH_XML
//    GNU_POT
//    RRC
//    RESX
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
