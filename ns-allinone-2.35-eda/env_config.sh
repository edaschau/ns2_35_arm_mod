#!/bin/bash

# Get the current directory (installation directory of ns2 and nam)
INSTALL_DIR="$(pwd)"

# Check if ns and nam executables exist in the current directory
if [ -f "$INSTALL_DIR/ns-2.35/ns" ] && [ -f "$INSTALL_DIR/nam-1.15/nam" ]; then
    # Add ns2 and nam to PATH for the current session
    export PATH="$INSTALL_DIR/bin:$INSTALL_DIR/ns-2.35:$INSTALL_DIR/nam-1.15:$INSTALL_DIR/tcl8.5.10/unix:$INSTALL_DIR/tk8.5.10/unix:$INSTALL_DIR/xgraph-12.2:$PATH"
    export LD_LIBRARY_PATH="$INSTALL_DIR/otcl-1.14:$INSTALL_DIR/lib:$LD_LIBRARY_PATH"
    
    # Determine the shell profile file to update
    PROFILE_FILE="$HOME/.bashrc"
    if [ ! -f "$PROFILE_FILE" ]; then
        PROFILE_FILE="$HOME/.profile"
    fi
    
    # Add ns2 and nam to PATH and LD_LIBRARY_PATH in the profile file
    echo "export PATH=\"$INSTALL_DIR/bin:$INSTALL_DIR/ns-2.35:$INSTALL_DIR/nam-1.15:$INSTALL_DIR/tcl8.5.10/unix:$INSTALL_DIR/tk8.5.10/unix:$INSTALL_DIR/xgraph-12.2:\$PATH\"" >> "$PROFILE_FILE"
    echo "export LD_LIBRARY_PATH=\"$INSTALL_DIR/otcl-1.14:$INSTALL_DIR/lib:\$LD_LIBRARY_PATH\"" >> "$PROFILE_FILE"
    
    # Source the profile to update the current session's environment
    source "$PROFILE_FILE"
    
    echo "ns2 and nam have been added to your $PROFILE_FILE and the current environment."
else
    echo "Error: ns or nam executables not found in the current directory."
fi
