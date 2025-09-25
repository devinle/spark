# Cursor IDE Restart Guide for Spark

## Why Restart is Required

Spark works by installing rules in your project's `.cursor/rules/spark/` directory. Cursor IDE loads these rules when it starts up, so **a restart is required** after installation for Spark to become available.

## Step-by-Step Restart Process

### 1. Save Your Work
Before restarting, make sure to save any open files in Cursor IDE:
- **Mac**: Cmd+S to save current file, or Cmd+Option+S to save all
- **Windows/Linux**: Ctrl+S to save current file, or Ctrl+K+S to save all

### 2. Quit Cursor IDE Completely
**Important**: Don't just close the window - quit the application completely:

- **Mac**: 
  - Press `Cmd+Q` to quit
  - Or go to Cursor menu → Quit Cursor
  - Or right-click Cursor in dock → Quit

- **Windows**: 
  - Press `Alt+F4` to close the window
  - Or click the X button in the top-right corner
  - Or right-click Cursor in taskbar → Close window

- **Linux**: 
  - Press `Alt+F4` to close the window
  - Or click the X button in the top-right corner
  - Or right-click Cursor in dock/taskbar → Quit

### 3. Reopen Cursor IDE
- Open Cursor IDE again
- Open your project (the one where you installed Spark)
- Wait for Cursor to fully load

### 4. Verify Spark is Working
1. Open the chat panel:
   - **Mac**: `Cmd+L`
   - **Windows/Linux**: `Ctrl+L`

2. Type `@spark help` and press Enter

3. If you see Spark's help message, installation was successful!

## Troubleshooting

### Spark Still Not Working After Restart?

1. **Check Installation**:
   ```bash
   ls .cursor/rules/spark/
   ```
   You should see files like `spark.mdc` and `.restart-required`

2. **Run Verification Script**:
   ```bash
   ./verify.sh
   ```
   This will check your installation and provide specific guidance

3. **Try Another Restart**:
   Sometimes Cursor needs a second restart to pick up new rules

4. **Check Cursor IDE Version**:
   Make sure you're using a recent version of Cursor IDE

5. **Verify Project Directory**:
   Make sure you're in the correct project directory where Spark was installed

### Common Issues

**"@spark not found" in chat**
- This means Cursor hasn't loaded the rules yet
- Try restarting Cursor IDE again
- Make sure you're in the project directory where Spark was installed

**"@spark" works but shows no response**
- Check that you're typing `@spark` (not `@cursor`)
- Make sure the chat panel is open (Cmd+L / Ctrl+L)
- Try typing just `@spark` first, then add component names

**Installation verification fails**
- Run `./verify.sh` to diagnose the issue
- Check file permissions in `.cursor/rules/spark/`
- Try reinstalling Spark

## Alternative: Manual Rule Reload

If you can't restart Cursor IDE right now, you can try:

1. Close all Cursor IDE windows
2. Wait 5-10 seconds
3. Reopen Cursor IDE

This sometimes works as a "soft restart" for rule loading.

## Still Having Issues?

If Spark still isn't working after following this guide:

1. **Check the troubleshooting section** in the main README.md
2. **Run the verification script**: `./verify.sh`
3. **Open an issue** on GitHub with:
   - Your operating system
   - Cursor IDE version
   - Output from `./verify.sh`
   - Any error messages you see

## Quick Reference

| Action | Mac | Windows/Linux |
|--------|-----|---------------|
| Save file | Cmd+S | Ctrl+S |
| Save all | Cmd+Option+S | Ctrl+K+S |
| Quit Cursor | Cmd+Q | Alt+F4 |
| Open chat | Cmd+L | Ctrl+L |
| Test Spark | Type `@spark help` | Type `@spark help` |

---

**Remember**: Spark only works in Cursor IDE's chat interface, not in the terminal or command line!
