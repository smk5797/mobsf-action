# GitHub Actions for MobSF

This Action for [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF) enables MobSF analysis actions using the MobSF docker.

## Inputs

* `INPUT_FILE_NAME` - **Required** - The input fila path to be analysed
* `SCAN_TYPE` - **Required** - the scan type: apk, zip, ipa, or appx
* `OUTPUT_FILE_NAME` - **Required** - the output file path (will output two files, the first with extension .json and the second .pdf)

## Example

To build a Flutter project with MobSF Analysis:

```yaml
name: Build and Deploy
on:
  push:
    branches:
      - master

jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:

      - name: Checkout Repo
        uses: actions/checkout@master

      - name: Set-up Java
        uses: actions/setup-java@v1
        with:
          java-version: '11'

      - name: Set-up Flutter
        uses: subosito/flutter-action@v1
        with:
          flutter-version: '3.10.0'

      - name: Flutter Install Dependencies
        run: flutter pub get

      - name: Flutter Build
        run: flutter build apk

      - name: Run MobSF Analysis
        uses: smk5797/mobsf-action@v1.7.15
        env:
          INPUT_FILE_NAME: build/app/outputs/flutter-apk/app-release.apk
          SCAN_TYPE: apk
          OUTPUT_FILE_NAME: mobsf-report

      - name: Upload MobSF Analysis PDF Result
        uses: actions/upload-artifact@v2
        with:
          name: mobsf-report.pdf
          path: mobsf-report.pdf

      - name: Upload MobSF Analysis JSON Result
        uses: actions/upload-artifact@v4
        with:
          name: mobsf-report.json
          path: mobsf-report.json

## License

The Dockerfile and associated scripts and documentation in this project are released under the [GPL-3.0](LICENSE).
