/* Shapelib Vala Bindings
 * Copyright 2017 Andreas Strasser
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
*/

[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename = "shapefil.h")]
namespace ShapeLib {
	[CCode (cprefix = "FT", has_type_id = false)]
	public enum DBFFieldType {
		String,
		Integer,
		Double,
		Logical,
		Invalid
	}

	[Compact]
 	[CCode (cname = "DBFInfo", free_function = "", cprefix = "DBF")]
	public class DBFHandle {
        	[CCode (cname = "DBFOpen")]
        	public DBFHandle (string pszDBFFile, string pszAccess);
        	[CCode (cname = "DBFCreate")]
        	public DBFHandle.create (string pszDBFFile);
        	[CCode (cname = "DBFGetRecordCount")]
        	public int get_record_count ();
        	[CCode (cname = "DBFGetFieldCount")]
        	public int get_field_count ();
        	[CCode (cname = "DBFGetFieldIndex")]
        	public int get_field_index (string pszFieldName);
        	[CCode (cname = "DBFAddField")]
        	public int add_field (string pszFieldName, ShapeLib.DBFFieldType eType, int nWidth, int nDecimals);
        	[CCode (cname = "DBFAddNativeFieldType")]
        	public int add_native_field_type (string pszFieldName, string chType, int nWidth, int nDecimals);
        	[CCode (cname = "DBFCloneEmpty")]
        	public unowned ShapeLib.DBFHandle clone_empty (string pszFilename);
        	[CCode (cname = "DBFClose")]
        	public void close ();
        	[CCode (cname = "DBFGetFieldInfo")]
        	public ShapeLib.DBFFieldType get_field_info (int iField, string pszFieldName, int pnWidth, int pnDecimals);
        	[CCode (cname = "DBFGetNativeFieldType")]
        	public unowned string get_native_field_type (int iField);
        	[CCode (cname = "DBFIsAttributeNULL")]
        	public int is_attribute_null (int iShape, int iField);
        	[CCode (cname = "DBFIsRecordDeleted")]
        	public int is_record_deleted (int iShape);
        	[CCode (cname = "DBFMarkRecordDeleted")]
        	public int mark_record_deleted (int iShape, int bIsDeleted);
        	[CCode (cname = "DBFReadDoubleAttribute")]
        	public double read_double_attribute (int iShape, int iField);
        	[CCode (cname = "DBFReadIntegerAttribute")]
        	public int read_integer_attribute (int iShape, int iField);
        	[CCode (cname = "DBFReadLogicalAttribute")]
        	public unowned string read_logical_attribute (int iShape, int iField);
        	[CCode (cname = "DBFReadStringAttribute")]
        	public unowned string read_string_attribute (int iShape, int iField);
        	[CCode (cname = "DBFReadTuple")]
        	public unowned string read_tuple (int hEntity);
        	[CCode (cname = "DBFUpdateHeader")]
        	public void update_header ();
        	[CCode (cname = "DBFWriteAttributeDirectly")]
        	public int write_attribute_directly (int hEntity, int iField, void* pValue);
        	[CCode (cname = "DBFWriteDoubleAttribute")]
        	public int write_double_attribute (int iShape, int iField, double dFieldValue);
        	[CCode (cname = "DBFWriteIntegerAttribute")]
        	public int write_integer_attribute (int iShape, int iField, int nFieldValue);
        	[CCode (cname = "DBFWriteLogicalAttribute")]
        	public int write_logical_attribute (int iShape, int iField, string lFieldValue);
        	[CCode (cname = "DBFWriteNULLAttribute")]
        	public int write_null_attribute (int iShape, int iField);
        	[CCode (cname = "DBFWriteStringAttribute")]
        	public int write_string_attribute (int iShape, int iField, string pszFieldValue);
        	[CCode (cname = "DBFWriteTuple")]
        	public int write_tuple (int hEntity, void* pRawTuple);
	}

	[Compact]
	public class DBFInfo {
		public unowned GLib.FileStream fp;
       	[CCode (cname = "nRecords")]
		public int n_records;
       	[CCode (cname = "nRecordLength")]
		public int n_Record_length;
       	[CCode (cname = "nHeaderLength")]
		public int n_header_length;
       	[CCode (cname = "nFields")]
		public int n_fields;
       	[CCode (cname = "panFieldOffset")]
		public int pan_field_offset;
       	[CCode (cname = "panFieldSize")]
		public int pan_field_size;
       	[CCode (cname = "panFieldDecimals")]
		public int pan_field_decimals;
       	[CCode (cname = "pachFieldType")]
		public unowned string pach_field_type;
       	[CCode (cname = "pszHeader")]
		public unowned string psz_header;
       	[CCode (cname = "nCurrentRecord")]
		public int n_current_record;
       	[CCode (cname = "bCurrentRecordModified")]
		public int b_current_record_modified;
       	[CCode (cname = "pszCurrentRecord")]
		public unowned string psz_current_record;
       	[CCode (cname = "bNoHeader")]
		public int b_no_header;
       	[CCode (cname = "bUpdated")]
		public int b_updated;
	}

	[Compact]
	[CCode (cname = "SHPHandle", free_function = "", cprefix = "SHP")]
	public class SHPHandle {
        	[CCode (cname = "SHPOpen")]
        	public SHPHandle (string pszShapeFile, string pszAccess);
        	[CCode (cname = "SHPCreate")]
        	public SHPHandle.create (string pszShapeFile, int nShapeType);
        	[CCode (cname = "SHPClose")]
        	public void close ();
        	[CCode (cname = "SHPCreateTree")]
        	public unowned ShapeLib.SHPTree create_tree (int nDimension, int nMaxDepth, double padfBoundsMin, double padfBoundsMax);
        	[CCode (cname = "SHPGetInfo")]
        	public void get_info (int pnEntities, int pnShapeType, double padfMinBound, double padfMaxBound);
        	[CCode (cname = "SHPReadObject")]
        	public unowned ShapeLib.SHPObject read_object (int iShape);
        	[CCode (cname = "SHPRewindObject")]
        	public int rewind_object (ShapeLib.SHPObject psObject);
        	[CCode (cname = "SHPWriteHeader")]
        	public void write_header (ShapeLib.SHPHandle hSHP);
        	[CCode (cname = "SHPWriteObject")]
        	public int write_object (ShapeLib.SHPHandle hSHP, int iShape, ShapeLib.SHPObject psObject);
	}

	[Compact]
	public class SHPInfo {
		public unowned GLib.FileStream fpSHP;
		public unowned GLib.FileStream fpSHX;
		public int nShapeType;
		public int nFileSize;
		public int nRecords;
		public int nMaxRecords;
		public int panRecOffset;
		public int panRecSize;
		[CCode (array_length = false)]
		public unowned double[] adBoundsMin;
		[CCode (array_length = false)]
		public unowned double[] adBoundsMax;
		public int bUpdated;
		public uint pabyRec;
		public int nBufSize;
	}

	[Compact]
	[CCode (cname = "SHPObject", cprefix = "SHP", free_function = "SPHDestroyObject")]
  	public class SHPObject {
		[CCode (cname = "SHPCreateObject")]
		public SHPObject (int nSHPType, int nShapeId, int nParts, int panPartStart, int panPartType, int nVertices, double padfX, double padfY, double padfZ, double padfM);
		[CCode (cname = "SHPCreateSimpleObject")]
        public SHPObject.simple (int nSHPType, int nVertices, double padfX, double padfY, double padfZ);
		public int nSHPType;
		public int nShapeId;
		public int nParts;
		public int panPartStart;
		public int panPartType;
		public int nVertices;
		public double padfX;
		public double padfY;
		public double padfZ;
		public double padfM;
		public double dfXMin;
		public double dfYMin;
		public double dfZMin;
		public double dfMMin;
		public double dfXMax;
		public double dfYMax;
		public double dfZMax;
		public double dfMMax;
		public int bMeasureIsUsed;
        [CCode (cname = "SHPComputeExtents")]
        public void compute_extents ();
	}

	[Compact]
	[CCode (cname = "SHPTree", cprefix = "SHP", free_function = "SPHDestroyTree")]
	public class SHPTree {
        [CCode (cname = "SHPReadTree")]
        public SHPTree (string pszFilename);
		public unowned ShapeLib.SHPHandle hSHP;
		public int nMaxDepth;
		public int nDimension;
		public int nTotalCount;
		public unowned ShapeLib.SHPTreeNode psRoot;
        [CCode (cname = "SHPTreeAddObject")]
        public int add_object (ShapeLib.SHPObject psObject);
        [CCode (cname = "SHPTreeAddShapeId")]
        public int add_shape_id (ShapeLib.SHPObject psObject);
        [CCode (cname = "SHPTreeFindLikelyShapes")]
        public int find_likely_shapes (double padfBoundsMin, double padfBoundsMax, int p4);
        [CCode (cname = "SHPTreeRemoveShapeId")]
        public int remove_shape_id (int nShapeId);
        [CCode (cname = "SHPTreeTrimExtraNodes")]
        public void trim_extra_nodes ();
        [CCode (cname = "SHPWriteTree")]
        public int write (string pszFilename);
	}
	[Compact]
	public class SHPTreeNode {
		[CCode (array_length = false)]
		public unowned double[] adfBoundsMin;
		[CCode (array_length = false)]
		public unowned double[] adfBoundsMax;
		public int nShapeCount;
		public int panShapeIds;
		public unowned ShapeLib.SHPObject papsShapeObj;
		public int nSubNodes;
		public void* apsSubNode;
	}

	public const int MAX_SUBNODE;
	public const int SHPP_FIRSTRING;
	public const int SHPP_INNERRING;
	public const int SHPP_OUTERRING;
	public const int SHPP_RING;
	public const int SHPP_TRIFAN;
	public const int SHPP_TRISTRIP;
	public const int SHPT_ARC;
	public const int SHPT_ARCM;
	public const int SHPT_ARCZ;
	public const int SHPT_MULTIPATCH;
	public const int SHPT_MULTIPOINT;
	public const int SHPT_MULTIPOINTM;
	public const int SHPT_MULTIPOINTZ;
	public const int SHPT_NULL;
	public const int SHPT_POINT;
	public const int SHPT_POINTM;
	public const int SHPT_POINTZ;
	public const int SHPT_POLYGON;
	public const int SHPT_POLYGONM;
	public const int SHPT_POLYGONZ;
	public const int XBASE_FLDHDR_SZ;
	[CCode (cname = "SHPCheckBoundsOverlap")]
	public static int check_bounds_overlap (double p1, double p2, double p3, double p4, int p5);
	[CCode (cname = "SHPSearchDiskTree")]
	public static int search_disk_tree (GLib.FileStream fp, double padfBoundsMin, double padfBoundsMax, int pnShapeCount);
	[CCode (cname = "SHPTypeName")]
	public static unowned string type_name (int nSHPType);
}
