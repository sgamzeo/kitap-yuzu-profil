enum PdfLoadingState {
  idle,
  loading,
  loaded,
  error;

  bool get isIdle => this == PdfLoadingState.idle;
  bool get isLoading => this == PdfLoadingState.loading;
  bool get isLoaded => this == PdfLoadingState.loaded;
  bool get isError => this == PdfLoadingState.error;
}
