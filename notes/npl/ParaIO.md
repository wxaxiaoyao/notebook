	class ParaFileSystemWatcher
	public:
		void AddDirectory(const char* filename);
		void RemoveDirectory(const char* filename);
		void AddCallback(const char* sCallbackScript);
    public:
	class ParaFileObject
	public:
		int m_nFromByte;
		int m_nByteCount;
	public:
		void close();
		int SetSegment(int nFromByte, int nByteCount);
		const char* GetBase64StringEx(int * pnStrLength=0);
		const char* GetBase64String();
		void seek(int offset);
		void seekRelative(int offset);
		void SetFilePointer(int lDistanceToMove,int dwMoveMethod);
		void WriteString(const char* str);
		void writeline(const char* str);
		const char* readline();
		const char* GetText();
		const std::string& GetText2(int fromPos, int nCount);
		void write(const char* buffer, int nSize);
		int WriteBytes(int nSize, const object& input);
		void WriteFloat(float value);
		float ReadFloat();
		void WriteInt(int value);
		int ReadInt();
		int GetFileSize();
	class PE_CORE_DECL ParaSearchResult
	public:
		void Release();
		int GetNumOfResult();
	class ParaZipWriter
	public:
	public:
	public:
	class PE_CORE_DECL ParaIO
	public:
	public:
		static const char* DecodePath(const char* input);
		static const char* EncodePath(const char* input);
		static const char* EncodePath2(const char* input, const char* varNames);
		static bool AddPathVariable(const char * sVarName, const char * sVarValue);
		static bool AddSearchPath(const char* sFile);
		static bool AddSearchPath2(const char* sFile, int nPriority);
		static bool RemoveSearchPath(const char* sFile);
		static std::string GetWritablePath();
		static bool ClearAllSearchPath();
		static unsigned long CRC32(const char* filename);
		static void UpdateMirrorFiles(const char* dirName, bool bOverwrite);
		static ParaZipWriter CreateZip(const char *fn, const char *password);
		static int DeleteFile(const char* sFilePattern);
		static bool MoveFile(const char* src, const char* dest);
		static bool CopyFile(const char* src, const char* dest, bool bOverride);
		static bool CreateNewFile(const char * filename);
		static bool OpenFileWrite(const char * filename);
		static bool OpenFile(const char * filename);
		static ParaFileObject OpenAssetFile(const char* filename);
		static ParaFileObject OpenAssetFile2(const char* filename, bool bDownloadIfNotUpToDate);
		static bool DoesAssetFileExist(const char* filename);
		static bool DoesAssetFileExist2(const char* filename, bool bSearchZipFile);
		static int SyncAssetFile_Async(const char* filename, const char* sCallBackScript);
		static int CheckAssetFile(const char* filename);
		static void LoadReplaceFile(const char* filename, bool bReplaceExistingOnes);
		static ParaFileObject open(const char * filename, const char *mode);
		static ParaFileObject openimage(const char * filename, const char *mode);
		static bool CreateDirectory(const char* filename);
		static void CloseFile();
		static void WriteString(const char* str);
		static const char* readline();
		static void write(const char* buffer, int nSize);
		static bool DoesFileExist(const char* filename, bool bSearchZipFiles);
		static bool DoesFileExist_(const char* filename);
		static bool BackupFile(const char* filename);
		static ParaSearchResult SearchFiles(const char* sRootPath, const char* sFilePattern, const char* sZipArchive, int nSubLevel, int nMaxFilesNum, int nFrom);
		static ParaSearchResult SearchFiles_c(const char* sRootPath, const char* sFilePattern, const char* sZipArchive, int nSubLevel);
		static string GetCurDirectory(DWORD dwDirectoryType);
		static const char* GetCurDirectory_(DWORD dwDirectoryType);
		static string GetParentDirectoryFromPath(const char* sfilename, int nParentCounts);
		static const char* GetParentDirectoryFromPath_(const char* sfilename, int nParentCounts);
		static string AutoFindParaEngineRootPath(const char* sFile);
		static const char* AutoFindParaEngineRootPath_(const char* sFile);
		static string ChangeFileExtension(const char* sFile, const string & sExt);
		static const char* ChangeFileExtension_(const char* sFile, const string & sExt);
		static string GetFileExtension(const char* sFile);
		static const char* GetFileExtension_(const char* sFile);
		static string GetRelativePath(const char* sAbsolutePath, const char* sRootPath);
		static const char* GetRelativePath_(const char* sAbsolutePath, const char* sRootPath);
		static string GetAbsolutePath(const char* sRelativePath, const char* sRootPath);
		static const char* GetAbsolutePath_(const char* sRelativePath, const char* sRootPath);
		static string GetFileName(const char* sFilePath);
		static const char* GetFileName_(const char* sFilePath);
		static int GetFileSize(const char* sFilePath);
		static bool GetFileInfo(const char* sFilePath, const object& inout);
		static string ToCanonicalFilePath(const char* sfilename, bool bBackSlash);
		static const char* ToCanonicalFilePath__(const char* sfilename, bool bBackSlash);
		static void SetDiskFilePriority(int nPriority);
		static int GetDiskFilePriority();
		static ParaFileSystemWatcher GetFileSystemWatcher(const char* filename);
		static void DeleteFileSystemWatcher(const char* name);
	class ParaXML
	private:
		static void LuaXML_ParseNode(lua_State *L, void* pNode);
	public:
		static int LuaXML_ParseString (lua_State *L);
		static int LuaXML_ParseFile (lua_State *L);
		into a single space or not. The default is to condense. Note changing this
		static void SetCondenseWhiteSpace( bool condense );
		static bool IsWhiteSpaceCondensed();

## 示例
使用ParaIO读文件  

	if not ParaIO.OpenFile("./test.txt") then 
		pirnt("file open failed!!!")
		return
	end	
	while (true) do 
		line = ParaIO.readline()
		print(line)
		if line == nil then 
			break
		end
	end
