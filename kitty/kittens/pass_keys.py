"""
Vim-Kitty Navigator integration
Allows seamless navigation between vim splits and kitty windows
"""

def main(args):
    pass

def handle_result(args, answer, target_window_id, boss):
    direction = args[1] if len(args) > 1 else None

    if direction == 'neighboring_window':
        boss.active_tab.neighboring_window(direction)
    elif direction in ('left', 'right', 'top', 'bottom'):
        boss.active_tab.neighboring_window(direction)
