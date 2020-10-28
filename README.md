# XcodeSchemesSorter

A simple command-line tool to sort schemes in an Xcode project.

## Building

```lang-shell
swift package clean
swift build -c release
cp .build/release/xcssort /usr/local/bin/xcssort
```

## Usage

```lang-shell
xcssort --projectFile <SomeProject.xcodeproj>
```

Run without any arguments to get command-line help:

```lang-shell
xcssort 
#OPTIONS:
#  --projectFile <projectFile>
#                          The Xcode project (i.e. .xcodeproj) whose schemes are to be sorted.
#  -h, --help              Show help information.
```

**NOTE**: This is a quick and dirty hack written to satisfy my own desire to sort Xcode schemes alphabetically—still can’t believe it’s not an option in Xcode, and that even dragging-and-dropping schemes in the Scheme Editor doesn’t work. There are no unit-tests at this point, though it’s working perfectly for me. Your mileage may vary.

**WARNING**: Ensure that your Xcode project has been committed to Git before sorting schemes.
