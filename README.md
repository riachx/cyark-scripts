# Cyark Scripts
Batch scripts made during my internship at CyArk. This repository contains a collection of scripts that automate various processes in Reality Capture software.

## Introduction

Reality Capture software is a powerful tool used in photogrammetry and 3D modeling. However, it can be time-consuming to perform certain tasks manually. These batch scripts aim to automate common processes within Reality Capture, making your workflow more efficient and less error-prone.

## Folder Structure

The repository is organized into four main folders, each containing scripts related to specific tasks:

1. **Component Script**: 
- Accepts a project file path from a user, finds the images, aligns each folder, and exports each alignment into a folder called "Components".

3. **Housekeeping Script**: 
- Imports alignment settings, a cache location, and ensures the Reality Capture program is correctly setup. 

5. **Simplification Script**: 
- A script that opens a model in Reality Capture and simplifies the number of triangles down in 50% decrements, until the model reaches 30M triangles. This script utilizes the equation M = log2 (N/30,000,000), where N = triangle count and M = number of times to divide. Utilizes powershell for math that requires greater than 32 bit limitations. 

6. **Slack Messaging Script**: 
- A simple bot that sends a slack message to a user once the script finishes.
