if (!isServer) exitWith {};
params ["_unit","_anim","_shans"];

private ["_unitGrp", "_unitGrpPR", "_pWeapon", "_sWeapon", "_hWeapon", "_magsremove", "_weapon", "_weaponHolder", "_weaponHolder0", "_ranpos", "_dis", "_Pos", "_timer","_numberOfKits", "_pWItems", "_sWItems", "_hWItems"];

_unitGrp = group _unit;
_unitGrpPR = str side group _unit;

if (alive _unit) then {
	_numberOfKits = {"FirstAidKit" == _x} count (items _unit);
	_unit removeItems "firstaidkit";
	[_unit] joinSilent grpNull;

	_pWeapon = primaryWeapon _unit;
	_sWeapon = secondaryWeapon _unit;
	_hWeapon = handgunWeapon _unit;
	_pWItems = primaryWeaponItems _unit;
	_sWItems = secondaryWeaponItems _unit;
	_hWItems = handgunItems _unit;

	_magsremove = magazines _unit;
	{_unit removeMagazineGlobal _x} forEach magazines _unit;

	_weapon = currentWeapon _unit;
	_unit removeWeaponGlobal (currentWeapon _unit);

	_weaponHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
	_weaponHolder addWeaponCargoGlobal [_weapon,1];
	_weaponHolder0 = "WeaponHolderSimulated" createVehicle [0,0,0];
	_weaponHolder0 addWeaponCargoGlobal [_weapon,1];

	if ("STAND" == stance _unit )  then {
		_weaponHolder setPos (_unit modelToWorld [0,0.2,1.2]);
		_weaponHolder0 setPos (_unit modelToWorld [0.08,0.22,1.22]);
	};
	if ("CROUCH" == stance _unit ) then {
		_weaponHolder setPos (_unit modelToWorld [0,0.2,0.8]);
		_weaponHolder0 setPos (_unit modelToWorld [0.08,0.22,0.82]);
	};
	if ("PRONE" == stance _unit ) then {
		_weaponHolder setPos (_unit modelToWorld [0,0.7,0.2]);
		_weaponHolder0 setPos (_unit modelToWorld [0.08,0.72,0.22]);
	};
	if ("UNDEFINED" == stance _unit ) then {
		_weaponHolder setPos (_unit modelToWorld [0,0.2,1.1]);
		_weaponHolder0 setPos (_unit modelToWorld [0.08,0.22,1.12]);
	};

	_weaponHolder setDir (getDir _unit);

	_weaponHolder setVelocity [3 * sin(((getDir _unit)-80) + (random 160)), 3 * cos(((getDir _unit)-80) + (random 160)),4];
	sleep 0.1;
	deleteVehicle _weaponHolder0;

	_unit removeWeaponGlobal (primaryWeapon _unit);
	_unit removeWeaponGlobal (secondaryWeapon _unit);
	_unit removeWeaponGlobal (handgunWeapon _unit);

	_ranpos = selectRandom [1,2,3];

	if (alive _unit) then {
		if ("STAND" == stance _unit )  then {
			if (_ranpos == 1) then {
			[_unit, ""] remoteExec ["switchMove", 0];
			[_unit, "ApanPercMstpSnonWnonDnon_G01"] remoteExec ["switchMove", 0];
			_unit disableAI "ANIM";
			sleep 1;
			_unit enableAI "ANIM";
			};
			if (_ranpos == 2) then {
			[_unit, ""] remoteExec ["switchMove", 0];
			[_unit, "ApanPercMstpSnonWnonDnon_ApanPknlMstpSnonWnonDnon"] remoteExec ["switchMove", 0];
			};
			if (_ranpos == 3) then {
			[_unit, ""] remoteExec ["switchMove", 0];
			[_unit, "ApanPercMstpSnonWnonDnon_ApanPpneMstpSnonWnonDnon"] remoteExec ["switchMove", 0];
			};
		};
		if ("CROUCH" == stance _unit ) then {
			if (_ranpos == 1) then {
			[_unit, ""] remoteExec ["switchMove", 0];
			[_unit, "ApanPknlMstpSnonWnonDnon_ApanPercMstpSnonWnonDnon"] remoteExec ["switchMove", 0];
			};
			if (_ranpos == 2) then {
			[_unit, ""] remoteExec ["switchMove", 0];
			[_unit, "ApanPknlMstpSnonWnonDnon_G01"] remoteExec ["switchMove", 0];
			_unit disableAI "ANIM";
			sleep 1;
			_unit enableAI "ANIM";
			};
			if (_ranpos == 3) then {
			[_unit, ""] remoteExec ["switchMove", 0];
			[_unit, "ApanPknlMstpSnonWnonDnon_ApanPpneMstpSnonWnonDnon"] remoteExec ["switchMove", 0];
			};
		};
		if ("PRONE" == stance _unit ) then {
			if (_ranpos == 1) then {
			[_unit, ""] remoteExec ["switchMove", 0];
			[_unit, "ApanPpneMstpSnonWnonDnon_ApanPercMstpSnonWnonDnon"] remoteExec ["switchMove", 0];
			};
			if (_ranpos == 2) then {
			[_unit, ""] remoteExec ["switchMove", 0];
			[_unit, "ApanPpneMstpSnonWnonDnon_ApanPknlMstpSnonWnonDnon"] remoteExec ["switchMove", 0];
			};
			if (_ranpos == 3) then {
			[_unit, ""] remoteExec ["switchMove", 0];
			[_unit, "ApanPpneMstpSnonWnonDnon_G01"] remoteExec ["switchMove", 0];
			_unit disableAI "ANIM";
			sleep 2;
			_unit enableAI "ANIM";
			};
		};

		if ("UNDEFINED" == stance _unit ) then {
			if (_ranpos == 1) then {
			[_unit, ""] remoteExec ["switchMove", 0];
			[_unit, "ApanPknlMstpSnonWnonDnon_ApanPercMstpSnonWnonDnon"] remoteExec ["switchMove", 0];
			};
			if (_ranpos == 2) then {
			[_unit, ""] remoteExec ["switchMove", 0];
			[_unit, "ApanPknlMstpSnonWnonDnon_G01"] remoteExec ["switchMove", 0];
			_unit disableAI "ANIM";
			sleep 1;
			_unit enableAI "ANIM";
			};
			if (_ranpos == 3) then {
			[_unit, ""] remoteExec ["switchMove", 0];
			_unit, "ApanPknlMstpSnonWnonDnon_ApanPpneMstpSnonWnonDnon"] remoteExec ["switchMove", 0];
			};
		};
		_unit setUnitPos "AUTO";


		_dis = (20 + random 65);
		_Pos = getPos _unit;


		_timer = (time + 25 + (random 20));

		waituntil { sleep 0.1; ((_unit distance _Pos >= _dis) or (!alive _unit) or (time >= _timer))};

	};
	sleep 0.5;
	if (alive _unit) then {
		//changed from multiple if (_ranpos == x) to a switch
		switch (_ranpos) do {
			case 1 : {[[_unit,"AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"] remoteExec ["switchMove"]];};
			case 2 : {[[_unit,"AmovPknlMstpSnonWnonDnon_AwopPknlMstpSoptWbinDnon"] remoteExec ["switchMove"]];};
			case 3 : {[[_unit,"AmovPpneMstpSnonWnonDnon_AinvPpneMstpSnonWnonDnon"] remoteExec ["switchMove"]];};
			default {};
		};
		_unit playMovenow "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon";

		sleep 2;
	};

	{
		_unit addMagazine [_x, 1];
	} forEach _magsremove;
	sleep 0.5;

	if (_numberOfKits > 0 ) then {
		for "_i" from 1 to _numberOfKits do {
			_unit addItem "FirstAidKit";
		};
	};

	if ( _weapon ==  _sWeapon ) then {
		if (str _pWeapon != "") then {
			_unit addWeaponGlobal _pWeapon;
			{
				_unit addprimaryWeaponItem _x;
			} forEach _pWItems;
		};
		if (str _hWeapon != "") then {
			_unit addWeaponGlobal _hWeapon;
			{
				_unit addhandgunItem _x;
			} forEach _hWItems;
		};
	};

	if ( _weapon ==  _pWeapon ) then {
		if (str _sWeapon != "") then {
			_unit addWeaponGlobal _sWeapon;
			{
				_unit addsecondaryWeaponItem _x;
			} forEach _sWItems;
		};
		if (str _hWeapon != "") then {
		_unit addWeaponGlobal _hWeapon;
		{
			_unit addhandgunItem _x;
		} forEach _hWItems;
		};
	};

	if ( _weapon ==  _hWeapon ) then {
		if (str _sWeapon != "") then {
			_unit addWeaponGlobal _sWeapon;
			{
				_unit addsecondaryWeaponItem _x;
			} forEach _sWItems;
		};
		if (str _pWeapon != "") then {
			_unit addWeaponGlobal _pWeapon;
			{
				_unit addprimaryWeaponItem _x;
			} forEach _pWItems;
		};
	};
	[_unit] joinSilent _unitGrp;
	_unit setVariable ["dam_ignore_injured0",false];
	_unit addMPEventHandler ["MPHit", {(_this select 0) spawn PiR0}];
};
