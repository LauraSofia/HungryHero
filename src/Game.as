package
{
	import events.NavigationEvent;
	
	import screens.InAbout;
	import screens.InGame;
	import screens.Welcome;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		private var screenWelcome:Welcome;
		private var screenInGame:InGame;
		private var screenInAbout:InAbout;
		
		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace ("starling framework initialized!");
			
			this.addEventListener(events.NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			screenInGame = new InGame();
			screenInGame.disposeTemporarily();
			this.addChild(screenInGame);
			
			screenInAbout = new InAbout();
			screenInAbout.disposeTemporarily();
			this.addChild(screenInAbout);
			
			screenWelcome = new Welcome();
			this.addChild(screenWelcome);
			screenWelcome.initialize();
		}
		
		private function onChangeScreen(event:NavigationEvent):void
		{
			switch (event.params.id)
			{
				case "play":
					screenWelcome.disposeTemporarily();
					screenInGame.initialize();
					break;
				
				case "about":
					screenWelcome.disposeTemporarily();
					screenInAbout.initialize();
					break;
					
				case "back":
					screenInAbout.disposeTemporarily();
					screenWelcome.initialize();
					break;
			}
		}
	}
}