//
//  MainWindowController.swift
//  SpeakLine
//
//  Created by Marco Herrera on 2/17/16.
//  Copyright (c) 2016 Marco Herrera. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController, NSSpeechSynthesizerDelegate
{
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var speakButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    
    let speechSynth = NSSpeechSynthesizer()
    var isStarted: Bool = false{
        didSet {
            updateButtons()
        }
    }
    
    
    override func windowDidLoad() {
        super.windowDidLoad()
        updateButtons()
        speechSynth.delegate = self
    }
    override var windowNibName: String
        {
        return "MainWindowController"
    }
    //MARK: - Action methods
    @IBAction func speakIt(sender: NSButton)
    {
        let string = textField.stringValue
        if string.isEmpty
        {
            println("string from \(textField) is empty")
        }
        else
        {
            speechSynth.startSpeakingString(string)
            isStarted = true
        }
    }
    @IBAction func stopIt(sender: NSButton)
    {
        speechSynth.stopSpeaking()
    }
    
    func updateButtons()
    {
        if isStarted
        {
            speakButton.enabled = false
            stopButton.enabled = true
        }
        else
        {
            speakButton.enabled = true
            stopButton.enabled = false
        }
    }
    
    //MARK: - NSSpeechSynthesizerDelegate
    
    func speechSynthesizer(sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        isStarted = false
        println("finishedSpeaking=\(finishedSpeaking)")
    }
    
}
