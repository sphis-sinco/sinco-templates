package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import lime.app.Application;

class PlayState extends FlxState
{
	override public function create()
	{
		add(new FlxText(10, 10, FlxG.width, '${Application.current.meta.get('file')}.${Main.BUILD}'));

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
