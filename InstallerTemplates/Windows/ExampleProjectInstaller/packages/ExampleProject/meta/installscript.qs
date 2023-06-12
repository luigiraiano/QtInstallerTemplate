/*
* Luigi Raiano
*/

// Project Name
var _proj_name = 'ExampleProject';
var _description = 'Launch ' + _proj_name;

function Component()
{
    // constructor
    if (!systemInfo.productVersion.startsWith("7"))
	{
        component.enabled = true;
    }
	else
	{
        component.enabled = false;
    }
}

Component.prototype.createOperations = function()
{
    try
	{
        // call the base create operations function
        component.createOperations();
    }
	catch (e)
	{
        console.log(e);
    }
	
    if (systemInfo.productType === "windows")
	{
			// Add Menu Shortcut
            component.addOperation( "CreateShortcut", "@TargetDir@/win64/deploy/" + _proj_name + ".exe",
									"@StartMenuDir@/" + _proj_name + ".lnk",
									"workingDirectory=@TargetDir@/win64/deploy",
									"iconPath=@TargetDir@/win64/icon/logo.ico", "iconId=0",
									("description=" + _description) );
									
			// Add Desktop Shortcut
            component.addOperation( "CreateShortcut",
									"@TargetDir@/win64/deploy/" + _proj_name + ".exe",
									"@HomeDir@/Desktop/" + _proj_name + ".lnk",
									"iconPath=@TargetDir@/win64/icon/logo.ico", "iconId=0",
									("description=" + _description) );
    }
}