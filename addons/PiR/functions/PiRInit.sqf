["PiR_injuriplayer_on", "CHECKBOX", ["Влючить ранения для игрока", "Enable injuries for player"], "Project injury Reaction", true] call cba_settings_fnc_init;

EyeEffect0 = compile preprocessfilelinenumbers "\PiR\Functions\EyeEffect0.sqf";

if (isServer) then {
	
Uncondition = compile preprocessfilelinenumbers "\PiR\Functions\Uncondition.sqf";
Crawl = compile preprocessfilelinenumbers "\PiR\Functions\Crawl.sqf";
DropWeapon = compile preprocessfilelinenumbers "\PiR\Functions\DropWeapon.sqf";
Helmet = compile preprocessfilelinenumbers "\PiR\Functions\Helmet.sqf";
BendsDown = compile preprocessfilelinenumbers "\PiR\Functions\BendsDown.sqf";
UnconditionAnim = compile preprocessfilelinenumbers "\PiR\Functions\UnconditionAnim.sqf";
EyeEffect = compile preprocessfilelinenumbers "\PiR\Functions\EyeEffect.sqf";
PiR = compile preprocessfilelinenumbers "\PiR\Functions\PiR.sqf";


Uncondition0 = compile preprocessfilelinenumbers "\PiR\Functions\Uncondition0.sqf";
Crawl0 = compile preprocessfilelinenumbers "\PiR\Functions\Crawl0.sqf";
DropWeapon0 = compile preprocessfilelinenumbers "\PiR\Functions\DropWeapon0.sqf";
Helmet0 = compile preprocessfilelinenumbers "\PiR\Functions\Helmet0.sqf";
BendsDown0 = compile preprocessfilelinenumbers "\PiR\Functions\BendsDown0.sqf";
UnconditionAnim0 = compile preprocessfilelinenumbers "\PiR\Functions\UnconditionAnim0.sqf";

PiR0 = compile preprocessfilelinenumbers "\PiR\Functions\PiR0.sqf";


_null = [] execvm "\PiR\Functions\PiRstart.sqf";

};




