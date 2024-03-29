/*
 * Jakefile
 * cappuccinoTimer
 *
 * Created by You on August 29, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

var ENV = require("system").env,
    FILE = require("file"),
    JAKE = require("jake"),
    task = JAKE.task,
    FileList = JAKE.FileList,
    app = require("cappuccino/jake").app,
    configuration = ENV["CONFIG"] || ENV["CONFIGURATION"] || ENV["c"] || "Debug",
    OS = require("os");

app ("cappuccinoTimer", function(task)
{
    task.setBuildIntermediatesPath(FILE.join("Build", "cappuccinoTimer.build", configuration));
    task.setBuildPath(FILE.join("Build", configuration));

    task.setProductName("cappuccinoTimer");
    task.setIdentifier("com.yourcompany.cappuccinoTimer");
    task.setVersion("1.0");
    task.setAuthor("Your Company");
    task.setEmail("feedback @nospam@ yourcompany.com");
    task.setSummary("cappuccinoTimer");
    task.setSources((new FileList("**/*.j")).exclude(FILE.join("Build", "**")));
    task.setResources(new FileList("Resources/**"));
    task.setIndexFilePath("index.html");
    task.setInfoPlistPath("Info.plist");
    task.setNib2CibFlags("-R Resources/");

    if (configuration === "Debug")
        task.setCompilerFlags("-DDEBUG -g");
    else
        task.setCompilerFlags("-O");
});

task ("default", ["cappuccinoTimer"], function()
{
    printResults(configuration);
});

task ("build", ["default"]);

task ("debug", function()
{
    ENV["CONFIGURATION"] = "Debug";
    JAKE.subjake(["."], "build", ENV);
});

task ("release", function()
{
    ENV["CONFIGURATION"] = "Release";
    JAKE.subjake(["."], "build", ENV);
});

task ("run", ["debug"], function()
{
    OS.system(["open", FILE.join("Build", "Debug", "cappuccinoTimer", "index.html")]);
});

task ("run-release", ["release"], function()
{
    OS.system(["open", FILE.join("Build", "Release", "cappuccinoTimer", "index.html")]);
});

task ("deploy", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Deployment", "cappuccinoTimer"));
    OS.system(["press", "-f", FILE.join("Build", "Release", "cappuccinoTimer"), FILE.join("Build", "Deployment", "cappuccinoTimer")]);
    printResults("Deployment")
});

task ("press", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Press", "cappuccinoTimer"));
    OS.system(["press", "-f", FILE.join("Build", "Release", "cappuccinoTimer"), FILE.join("Build", "Press", "cappuccinoTimer")]);
});
 
task ("flatten", ["press"], function()
{
    FILE.mkdirs(FILE.join("Build", "Flatten", "cappuccinoTimer"));
    OS.system(["flatten", "-f", "--verbose", "-c", "closure-compiler", FILE.join("Build", "Press", "cappuccinoTimer"), FILE.join("Build", "Flatten", "cappuccinoTimer")]);
});

task ("desktop", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Desktop", "cappuccinoTimer"));
    require("cappuccino/nativehost").buildNativeHost(FILE.join("Build", "Release", "cappuccinoTimer"), FILE.join("Build", "Desktop", "cappuccinoTimer", "cappuccinoTimer.app"));
    printResults("Desktop")
});

task ("run-desktop", ["desktop"], function()
{
    OS.system([FILE.join("Build", "Desktop", "cappuccinoTimer", "cappuccinoTimer.app", "Contents", "MacOS", "NativeHost"), "-i"]);
});

function printResults(configuration)
{
    print("----------------------------");
    print(configuration+" app built at path: "+FILE.join("Build", configuration, "cappuccinoTimer"));
    print("----------------------------");
}
