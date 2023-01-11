#!python3
import json
import subprocess

class Clipboard:
  def __init__(self, file: str) -> None:
      self.file = file
      try: 
          with open(self.file, 'r') as openfile:
              json_object = json.load(openfile)
      except: 
          json_object = { "clipboard": [] }
      self.storage = json_object

  def write_to_clipboard(self) -> None:
      json_object = json.dumps(self.storage, indent=4)
      with open(self.file, "w") as outfile:
          outfile.write(json_object)

  def add_to_clipboard(self) -> bool:
      clip = subprocess.check_output("pbpaste").decode('utf-8').strip()
      if clip not in self.storage["clipboard"]:
          if len(self.storage["clipboard"]) < 5:
              self.storage["clipboard"].append(clip)
          else:
              self.storage["clipboard"].pop(0)
              self.storage["clipboard"].append(clip)
          return True
      return False

  def draw_clipboard(self) -> None:
      options: list[str] = []
      if len(self.storage["clipboard"]) == 0:
          options += [
              'sketchybar',
              '-m',
              "--remove", 
              '/clipboard.template.[0-5]/',
              '--add',
              'item',
              f'clipboard.template.0', 
              'popup.clipboard',
              '--set',
              f'clipboard.template.0',
              'icon="Clipboard: "',
              'label="nothing has been copied"'
          ]
          subprocess.call(options)
      for clip in range(0, len(self.storage["clipboard"])):
          options += [
              'sketchybar',
              '-m',
              "--remove", 
              '/clipboard.template.[0-5]/',
              '--add',
              'item',
              f'clipboard.template.{clip}', 
              'popup.clipboard',
              '--set',
              f'clipboard.template.{clip}',
              'icon=◆',
              'icon.font="JetBrains Mono:Regular:14.0"',
              f'label={self.storage["clipboard"][clip]}',
              '--set',
              f'clipboard.template.{clip}',
               f"""click_script=`echo '{self.storage["clipboard"][clip]}' | pbcopy` """
              'drawing=on',
              'label.width=120',
              'background.corner_radius=12',
              'background.padding_left=12',
              'background.padding_right=12',
              'background.drawing=off'
          ]
          try:
              subprocess.call(options)
          except subprocess.CalledProcessError as e:
              print ("write_to_clipboard.ERROR: ", e.output)

if __name__ == "__main__":
  clipboard = Clipboard("/Users/itaysharir/.config/.clipboard_storage.json")
  if clipboardHasChanged := clipboard.add_to_clipboard():
      clipboard.write_to_clipboard()
      clipboard.draw_clipboard()
