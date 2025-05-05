# Hangman CLI 🎯

A simple command-line Hangman game built with Ruby, developed as part of the [Fullstack Ruby curriculum](https://www.theodinproject.com/paths/full-stack-ruby-on-rails) from The Odin Project.

This project demonstrates file I/O, class design, YAML serialization, and a basic terminal interface.

---

## 📦 Features

- Random word selection from a custom word list (`words.txt`)
- Input validation and feedback on repeated guesses
- Save and load functionality via `YAML` files
- Clean command-line interface with clear instructions and status updates

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/hangman-ruby.git
cd hangman-ruby

2. Prepare your environment
Ensure you have Ruby installed (version 2.5 or higher recommended).
You also need a words.txt file containing words (one per line), ideally between 5 and 12 characters each.

3. Run the game

ruby main.rb


💡 How to Play
Upon starting the game:

Press N to begin a new game with a randomly selected word.

Press C to continue a previously saved game (if available).

During gameplay:

Enter a single letter to guess.

Type save at any time to save your progress and exit.

💾 Save System
Your progress is saved to a file named save_game.yaml in the project root.
If this file exists, you can resume your game later using the C option at the start screen.

📁 Project Structure
hangman-ruby/
├── main.rb           # Entry point of the game
├── hangman.rb        # Core game logic and classes
├── words.txt         # List of possible words (one per line)
├── save_game.yaml    # Auto-generated file used to save/load game state
└── README.md         # Project documentation


🛠️ Built With
Ruby

YAML for serialization

File I/O (File.open)

Command-line interaction

🙋‍♂️ Author
Made with dedication by GustavoLVJardim
For learning and portfolio purposes.

📝 License
This project is open source and available under the MIT License.
