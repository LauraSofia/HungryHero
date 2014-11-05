package objects
{
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Obstacle extends Sprite
	{
		private var _type:int;
		private var _speed:int;
		private var _distance:int;
		private var _watchOut:Boolean;
		private var _alreadyHit:Boolean;
		private var _position:String;
		private var obstacleImage:Image;
		private var obstacleCrashImage:Image;
		private var obstacleAnimation:MovieClip;
		private var watchOutAnimation:MovieClip;
		
		public function Obstacle(_type:int, _distance:int, _watchOut:Boolean = true, _speed:int = 0)
		{
			super();
			
			this._type = _type;
			this._distance = _distance;
			this._watchOut = _watchOut;
			this._speed = _speed;
			
			_alreadyHit = false;
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			createObstacleArt();
			createObstacleCrashArt();
			createWatchOutAnimation();
		}
		
		private function createWatchOutAnimation():void
		{
			watchOutAnimation = new MovieClip(Assets.getAtlas().getTextures("watchout_"), 10);
			Starling.juggler.add(watchOutAnimation);
			
			if (_type == 4)
			{
				watchOutAnimation.x = -watchOutAnimation.texture.width;
				watchOutAnimation.y = obstacleAnimation.y + (obstacleAnimation.texture.height * 0.5) - (watchOutAnimation.texture.height * 0.5);
			}
		}
		
		private function createObstacleCrashArt():void
		{
			obstacleCrashImage = new Image(Assets.getAtlas().getTexture("obstacle" + _type + "_crash"));
			obstacleCrashImage.visible = false;
			this.addChild(obstacleCrashImage);
		}
		
		private function createObstacleArt():void
		{
			if (_type == 4)
			{
				obstacleAnimation = new MovieClip(Assets.getAtlas().getTextures("obstacle" + _type + "_0"), 10);
				Starling.juggler.add(obstacleAnimation);
				obstacleAnimation.x = 0;
				obstacleAnimation.y = 0;
				this.addChild(obstacleAnimation);
			}
			else
			{
				obstacleImage = new Image(Assets.getAtlas().getTexture("obstacle" + _type));
				obstacleImage.x = 0;
				obstacleImage.y = 0;
				this.addChild(obstacleImage);
			}
		}
	}
}